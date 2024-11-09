<script>
  import Ball from './Ball.svelte'; // Import directly from the same folder
</script>

<div class="container">
  <div class="ball-container">
    <Ball />
  </div>
  <div class="title-container">
    <span class="gradient-text">Generative AI</span>
  </div>
</div>

<style>
  /* Container for layout */
  .container {
    display: flex;
    position: relative; /* Make the container relative for absolute positioning */
    width: 100%;
    height: 100vh; /* Make the container full screen height */
    padding: 0 20px; /* Optional padding */
  }

  /* Ball container styling */
  .ball-container {
    position: absolute;
    left: 150px; /* Move the ball 150px from the left edge */
    top: 50%;
    transform: translateY(-50%); /* Center the ball vertically */
    width: 100px; /* Fixed width for the ball */
    height: 100px; /* Fixed height for the ball */
    display: flex;
    justify-content: center;
    align-items: center;
  }

  /* Title container styling */
  .title-container {
    flex: 1;
    display: flex;
    justify-content: flex-end; /* Align the title to the right */
    align-items: center;
    height: 100%;
  }

  /* Gradient text styling */
  .gradient-text {
    font-size: 3rem; /* Adjust font size as needed */
    font-weight: bold;
    background: linear-gradient(to right, #d8141c, white);
    background-clip: text;
    -webkit-background-clip: text; /* For Safari */
    color: transparent;
    padding-bottom: 2px; /* Add some padding below the text */
  }
</style>

