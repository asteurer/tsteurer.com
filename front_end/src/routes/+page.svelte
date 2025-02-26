<script>
  // Props for the component
  export let imageUrl = 'https://s3.us-west-2.amazonaws.com/tsteurer.com/about/drum_self_portrait.jpeg'; // URL to your image
  export let altText = 'Self portrait'; // Alt text for accessibility
  export let titleSize = '2rem';
  export let paragraphSize = '1.25rem';
  export let backgroundColor = 'rgba(0, 0, 0, 0.6)'; // Semi-transparent background color
  export let textColor = 'white'; // Text color
  export let padding = '1rem'; // Padding around the text
  export let position = 'top'; // Position of the overlay: 'top', 'bottom', 'center'
</script>

<div class="image-container">
  <div
    class="text-overlay {position}"
    style="background-color: {backgroundColor}; color: {textColor}; padding: {padding}"
  >
    <div class="text-content">
      <h2 style:font-size={titleSize}>Tyson Steurer</h2>
      <p style:font-size={paragraphSize}>I am currently pursuing a spot in the Post Production track in the Digital Cinema Production major, with the goal of graduating with an emphasis in sound. My passion for sound design is deeply rooted in my love for music, having spent years playing and listening as a drummer, percussionist, and pianist. I believe this musical foundation will enhance my technical skills in the field of sound design, providing a unique edge in crafting immersive audio experiences for film and media.</p><br>
      <p style:font-size={paragraphSize}>I bring a solid technical skill set, particularly in editing with Descript, as well as experience with Davinci Resolve, Premiere Pro, and Avid Media Composer. One of my most significant accomplishments to date is single-handedly editing a 70-episode course on healing from betrayal trauma called Courageous Together. This project honed my editing abilities and reinforced my commitment to delivering high-quality work that impacts and educates. I’m excited to continue developing my post-production skills through both academic studies and real-world applications.</p><br>
      <p style:font-size={paragraphSize}>Looking ahead, my professional goal is to build a versatile portfolio and grow my network within the industry. I am actively seeking internship opportunities to further develop my skill set and become an asset in post-production work. Ultimately, I hope to work as a contract worker in Indie films and advertisements, using my editing and sound design expertise to create compelling, high-impact content.</p><br>
    </div>
  </div>
  <img src={imageUrl} alt={altText} />
</div>

<style>
  .image-container {
    position: relative;
    width: 100%;
    height: auto;
    overflow: hidden;
  }

  img {
    display: block;
    width: 100%;
    height: auto;
  }

  .text-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      box-sizing: border-box;
      display: flex;
      flex-direction: column;
      text-align: center;
  }

  .text-content {
    width: 80%;
    margin: 0 auto;
  }

  h2 {
      margin: 0 0 1rem 0;
  }

  p {
      margin: 0;
      line-height: 1.5;
      text-align: left;
  }

  .top {
    justify-content: flex-start;
    padding-top: 3rem;
  }

  .bottom {
    justify-content: flex-end;
    padding-bottom: 2rem;
  }

  .center {
    justify-content: center;
  }
</style>