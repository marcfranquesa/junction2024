<script>
  import Ball from './Ball.svelte'; // Import Ball component

  // Function to handle redirection on click
  function redirectToFeatures() {
    window.location.href = '/features';
  }
</script>

<div class="container">
  <!-- Logo Image at Top Left -->
  <img src="logo.png" alt="Logo" class="logo" />

  <!-- Ball Component -->
  <Ball />

  <!-- Invisible Clickable Overlay over the Ball Component -->
  <div class="clickable-overlay" on:click={redirectToFeatures}></div>

  <!-- Gradient Text -->
  <div class="text-container">
    <span class="gradient-text">Feature Insights</span>
    <span class="gradient-text">Platform</span>
  </div>
</div>

<style>
  /* Importing Google Font */
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');

  /* Container for layout */
  .container {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
    width: 100%;
    height: 100vh;
  }

  /* Logo styling for top-left position */
  .logo {
    position: absolute;
    top: 20px;
    left: -150px;
    width: 150px; /* Adjust size as needed */
    height: auto;
    z-index: 15; /* Ensure logo is above other elements */
  }

  /* Text container styling */
  .text-container {
    position: absolute;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 10;
    color: transparent;
    margin-bottom: 350px; /* Adjust text position */
  }

  /* Gradient text styling */
  .gradient-text {
    font-family: 'Poppins', sans-serif;
    font-size: 3rem;
    font-weight: 600;
    background: white;
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
    padding-bottom: 2px;
    margin: 5px 0;
  }

  /* Clickable overlay positioned over the Ball component */
  .clickable-overlay {
    position: absolute;
    top: 50%; /* Adjust as needed to match Ball position */
    transform: translateY(-50%);
    width: 300px; /* Adjust width to match Ball size */
    height: 300px; /* Adjust height to match Ball size */
    z-index: 12; /* Ensure it is above Ball but below the logo */
    cursor: pointer;
  }
</style>

