<script>
  import Ball from './Ball.svelte'; // Import Ball component
</script>

<div class="container">
  <!-- Logo Image at Top Left -->
  <img src="logo.png" alt="Logo" class="logo" />

  <!-- Ball Component and Text -->
  <Ball />
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
    z-index: 15; /* Make sure logo is above the Ball */
  }

  /* Gradient text container styling */
  .text-container {
    position: absolute;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 10;
    color: transparent;
    margin-bottom: 350px; /* Adjust the text position */
  }

  /* Gradient text styling */
  .gradient-text {
    font-family: 'Poppins', sans-serif; /* Apply custom font */
    font-size: 3rem;
    font-weight: 600;
    background: white;
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
    padding-bottom: 2px;
    margin: 5px 0;
  }
</style>

