<script>
    import Feature from './Feature.svelte';
    export let data;
    const { features } = data;
    let searchQuery = '';
    $: filteredFeatures = features.filter(feature => 
        feature.tag.toLowerCase().includes(searchQuery.toLowerCase()) ||
        feature.client_list.toLowerCase().includes(searchQuery.toLowerCase()) ||
        feature.status.toLowerCase().includes(searchQuery.toLowerCase())
    );
</script>

<div class="container">
    <h1 class="title">Features Dashboard</h1>
    
    <!-- Search Bar -->
    <div class="search-container">
        <input
            type="text"
            bind:value={searchQuery}
            placeholder="Search features, clients, or status..."
            class="search-input"
        />
        {#if searchQuery}
            <button 
                class="clear-button" 
                on:click={() => searchQuery = ''}
                aria-label="Clear search"
            >
                ×
            </button>
        {/if}
    </div>

    <div class="features-list">
        {#each filteredFeatures as feature (feature.feature_id)}
            <Feature {feature} />
        {/each}
        
        {#if filteredFeatures.length === 0}
            <div class="no-results">
                No features found matching "{searchQuery}"
            </div>
        {/if}
    </div>
</div>
<style>
    .container {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 1rem;
    }

    .title {
        font-size: 2rem;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 2rem;
    }

    .search-container {
        position: relative;
        margin-bottom: 1.5rem;
    }

    .search-input {
        width: 100%;
        padding: 0.75rem 1rem;
        padding-right: 2.5rem;
        font-size: 1rem;
        border: 2px solid #e5e7eb;
        border-radius: 8px;
        outline: none;
        transition: border-color 0.2s ease, box-shadow 0.2s ease;
    }

    .search-input:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
    }

    .clear-button {
        position: absolute;
        right: 0.75rem;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        font-size: 1.25rem;
        color: #6b7280;
        cursor: pointer;
        padding: 0.25rem;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background-color 0.2s ease;
    }

    .clear-button:hover {
        background-color: #f3f4f6;
        color: #1f2937;
    }

    .features-list {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        max-height: 80vh;
        overflow-y: auto;
        padding-right: 1rem;
    }

    .no-results {
        text-align: center;
        padding: 2rem;
        color: #6b7280;
        background: #f9fafb;
        border-radius: 8px;
        font-size: 1.1rem;
    }

    /* Scrollbar styling */
    .features-list::-webkit-scrollbar {
        width: 8px;
    }

    .features-list::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 4px;
    }

    .features-list::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 4px;
    }

    .features-list::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
</style>
