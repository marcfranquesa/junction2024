<script>
    import Feature from './Feature.svelte';
    export let data;
    const { features } = data;
</script>

<div class="container">
    <h1 class="title">Features Dashboard</h1>
    <div class="features-list">
        {#each features as feature (feature.feature_id)}
            <Feature {feature} />
        {/each}
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

    .features-list {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        max-height: 80vh;
        overflow-y: auto;
        padding-right: 1rem;
    }

    /* Styling the scrollbar */
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
