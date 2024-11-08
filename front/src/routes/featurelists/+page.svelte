<script>
  import { onMount } from 'svelte';
  import { writable } from 'svelte/store';

  export let features = [];

  // State for filters
  let searchQuery = writable('');
  let showActive = writable(false);
  let showInactive = writable(false);

  // Filtered features
  let filteredFeatures = writable(features);

  // Update filter when the searchQuery or switches change
  function filterFeatures() {
    let filtered = features;

    // Filter by search query
    if ($searchQuery) {
      filtered = filtered.filter(feature =>
        feature.tag.toLowerCase().includes($searchQuery.toLowerCase())
      );
    }

    // Filter by status
    if ($showActive || $showInactive) {
      filtered = filtered.filter(feature => {
        const isActive = feature.status === 'active';
        const isInactive = feature.status === 'inactive';
        return (
          ($showActive && isActive) ||
          ($showInactive && isInactive)
        );
      });
    }

    filteredFeatures.set(filtered);
  }

  // Watch for changes in filters
  $: searchQuery, filterFeatures();
  $: showActive, filterFeatures();
  $: showInactive, filterFeatures();

  onMount(() => {
    filterFeatures();
  });
</script>

<div class="filter-bar">
  <input
    type="text"
    placeholder="Search features..."
    bind:value={$searchQuery}
    class="search-input"
  />
  <div class="switches">
    <label>
      <input type="checkbox" bind:checked={$showActive} /> Active
    </label>
    <label>
      <input type="checkbox" bind:checked={$showInactive} /> Inactive
    </label>
  </div>
</div>

<div class="feature-list">
  {#each $filteredFeatures as feature}
    <Feature {feature} />
  {/each}
</div>

<style>
  .filter-bar {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .search-input {
    width: 60%;
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
  }

  .switches {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .switches input {
    margin-right: 5px;
  }

  .feature-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
  }
</style>

