<script lang="ts">
  import Slideshow from '$lib/components/Slideshow.svelte';
  import SplitBackground from '$lib/components/Background.svelte';
  let baseURL ='https://s3.us-east-2.amazonaws.com/tsteurer.com-prod/crew-work/';

  // Sample slide data
  const slides = [
    {
      type: 'image',
      src: baseURL + 'batman.jpeg',
    },
    {
      type: 'video',
      src: baseURL + 'lenny_short_film.mp4',
    },
    {
      type: 'image',
      src: baseURL + 'martian_1.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'martian_2.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'martian_3.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'martian_4.jpeg',
    },
    {
      type: 'video',
      src: baseURL + 'tmnt_swede.mp4',
    },
    {
      type: 'image',
      src: baseURL + 'tmnt.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'viking_1.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'viking_2.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'viking_3.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'western_1.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'western_2.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'western_3.jpeg',
    }
  ];
</script>

<SplitBackground>
  <div class="page-container">
    <h1>Crew Work</h1>

    <div class="slideshow-wrapper">
      <Slideshow
        {slides}
        autoplayInterval={7000}
        showControls={true}
        showIndicators={true}
      />
    </div>
  </div>
</SplitBackground>

<style>
  .page-container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
  }

  .slideshow-wrapper {
    aspect-ratio: 16 / 9;
    width: 100%;
    background-color: #f0f0f0;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  h1 {
    margin-bottom: 20px;
    text-align: center;
    color: #061E45;
  }
</style>