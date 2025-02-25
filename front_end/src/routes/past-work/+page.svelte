<script lang="ts">
  import Slideshow from '$lib/components/Slideshow.svelte';
  import SplitBackground from '$lib/components/Background.svelte';
  let baseURL = 'https://s3.us-east-2.amazonaws.com/tsteurer.com-prod/past-work/';
  // Sample slide data
  const slides = [
    {
      type: 'video',
      src: baseURL + 'cousin_ricky.mp4',
    },
    {
      type: 'image',
      src: baseURL + 'cousin_ricky.jpeg',
    },
    {
      type: 'video',
      src: baseURL + 'all_about_me.mp4',
    },
    {
      type: 'image',
      src: baseURL + 'bryce_canyon.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'CT1.png',
    },
    {
      type: 'video',
      src: baseURL + 'CT2.mp4',
    },
    {
      type: 'video',
      src: baseURL + 'CT3.mp4',
    },
    {
      type: 'video',
      src: baseURL + 'fisker.mp4',
    },
    {
      type: 'video',
      src: baseURL + 'gnarly.mp4',
    },
    {
      type: 'video',
      src: baseURL + 'how_to_video.mp4',
    },
    {
      type: 'video',
      src: baseURL + 'jacuzzi.mp4',
    },
    {
      type: 'image',
      src: baseURL + 'podcast_logo.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'poie_logo.jpeg',
    },
    {
      type: 'image',
      src: baseURL + 'three_photos.jpeg',
    },
    {
      type: 'audio',
      src: baseURL + '6_of_1.mp3',
    },
    {
      type: 'pdf',
      src: baseURL + 'script_conflict_scene.pdf',
    },
  ];
</script>

<SplitBackground>
  <div class="page-container">
    <h1>Past Work</h1>

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