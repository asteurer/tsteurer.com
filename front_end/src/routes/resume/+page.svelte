<script lang="ts">
  import SplitBackground from '$lib/components/Background.svelte';
  const resumeURL: string = 'https://s3.us-west-2.amazonaws.com/tsteurer.com/resume/resume.jpeg';
</script>
<SplitBackground>
  <div class="resume-container">
    <img src={resumeURL} alt="resume" class="resume">
  </div>
</SplitBackground>

<style>
  .resume-container {
    width: 100%;
    height: 90vh;  /* Takes up 90% of the viewport height */
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
  }
  .resume-container img {
    border: 1px solid black;
    max-width: 90%;
  }
</style>