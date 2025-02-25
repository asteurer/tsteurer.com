<script lang="ts">
  // Define the type for our slide items
  type MediaType = 'image' | 'video' | 'audio' | 'pdf';

  interface SlideItem {
    type: MediaType;
    src: string;
    alt?: string; // For images
    autoplay?: boolean; // For videos and audio
    loop?: boolean; // For videos and audio
    startPage?: number; // For PDFs
  }

  // Props
  export let slides: SlideItem[] = [];
  export let autoplayInterval: number = 5000; // Time in ms before auto-advancing (for images)
  export let showControls: boolean = true;
  export let showIndicators: boolean = true;
  export let pdfScale: number = 1;

  // State
  let currentIndex: number = 0;
  let timer: ReturnType<typeof setTimeout> | null = null;
  let currentPdfPage: number = 1;
  let totalPdfPages: number = 1;

  // Helper to get current slide
  $: currentSlide = slides[currentIndex];

  // Start/stop autoplay timer based on media type
  $: {
    // Clear any existing timer when slide changes
    if (timer) clearTimeout(timer);

    // Only auto-advance for images
    if (currentSlide && currentSlide.type === 'image') {
      timer = setTimeout(() => {
        next();
      }, autoplayInterval);
    }

    if (currentSlide && currentSlide.type == 'pdf') {
      currentPdfPage = currentSlide.startPage || 1;
    }
  }

  // Navigation functions
  function next() {
    currentIndex = (currentIndex + 1) % slides.length;
  }

  function prev() {
    currentIndex = (currentIndex - 1 + slides.length) % slides.length;
  }

  function goToSlide(index: number) {
    currentIndex = index;
  }

  // Clean up timer on component destroy
  import { onDestroy } from 'svelte';
  onDestroy(() => {
    if (timer) clearTimeout(timer);
  });
</script>

<div class="slideshow-container">
  <!-- Current slide -->
  <div class="slide">
    {#if currentSlide}
      {#if currentSlide.type === 'image'}
        <img
          src={currentSlide.src}
          alt={currentSlide.alt || 'Slideshow image'}
          class="slide-media"
        />
      {:else if currentSlide.type === 'video'}
        <video
          src={currentSlide.src}
          class="slide-media"
          controls={showControls}
          autoplay={currentSlide.autoplay ?? true}
          loop={currentSlide.loop ?? false}
          muted="true"
          on:ended={() => next()}
        >
          Your browser does not support the video tag.
        </video>

      {:else if currentSlide.type === 'audio'}
      <div class="audio-container">
        <div class="audio-placeholder">
          <div class="audio-icon">🎵</div>
        </div>
        <audio
          src={currentSlide.src}
          controls={showControls}
          autoplay={currentSlide.autoplay ?? true}
          loop={currentSlide.loop ?? false}
          on:ended={() => next()}
        >
          Your browser does not support the audio tag.
        </audio>
      </div>

      {:else if currentSlide.type === 'pdf'}
      <div class="pdf-container">
        <!-- Here we use an iframe to embed the PDF -->
        <iframe
          src={`${currentSlide.src}#page=${currentPdfPage}`}
          class="pdf-frame"
        ></iframe>
      </div>
      {/if}
    {/if}
  </div>

  <!-- Navigation controls -->
  {#if showControls}
    <button class="nav-button prev" on:click={prev}>
      &lt;
    </button>
    <button class="nav-button next" on:click={next}>
      &gt;
    </button>
  {/if}

  <!-- Slide indicators -->
  {#if showIndicators && slides.length > 1}
    <div class="indicators">
      {#each slides as _, i}
        <button
          class="indicator {i === currentIndex ? 'active' : ''}"
          on:click={() => goToSlide(i)}
        ></button>
      {/each}
    </div>
  {/if}
</div>

<style>
  .slideshow-container {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
    background-color: transparent;
  }

  .slide {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: transparent;
  }

  .slide-media {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
  }

  .nav-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 18px;
    border-radius: 4px;
    z-index: 10;
  }

  .nav-button.prev {
    left: 10px;
  }

  .nav-button.next {
    right: 10px;
  }

  .indicators {
    position: absolute;
    bottom: 10px;
    width: 100%;
    display: flex;
    justify-content: center;
    gap: 8px;
  }

  .indicator {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.5);
    border: none;
    cursor: pointer;
  }

  .indicator.active {
    background-color: white;
  }

  .audio-container {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  background-color: transparent;
}

.audio-placeholder {
  width: 200px;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f1f1f1;
  border-radius: 10px;
  margin: 20px 0;
}

.audio-icon {
  font-size: 80px;
  color: #666;
}

.pdf-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  background-color: transparent;
}

.pdf-frame {
  width: 100%;
  height: 100%;
  border: none;
  background-color: transparent;
}
</style>