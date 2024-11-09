<script>
    export let feature;

    // Convert client_list string to array
    $: clients = feature.client_list.split(', ');

    // Function to get status color
    $: statusColor = feature.status === 'active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800';
</script>

<a href="/feature/{feature.feature_id}" class="feature-link">
    <div class="feature-card">
        <div class="feature-header">
            <h2 class="feature-title">{feature.tag}</h2>
            <span class="status-badge {statusColor}">
                {feature.status}
            </span>
        </div>

        <div class="client-section">
            <h3 class="client-title">Clients</h3>
            <div class="client-tags">
                {#each clients as client}
                    <span class="client-tag">{client}</span>
                {/each}
            </div>
        </div>

        <div class="feature-footer">
            <span class="feature-id">ID: {feature.feature_id}</span>
        </div>
    </div>
</a>

<style>
    .feature-link {
        text-decoration: none;
        color: inherit;
        display: block;
    }

    .feature-card {
        background: white;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .feature-link:hover .feature-card {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .feature-card {
        background: white;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .feature-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .feature-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
    }

    .feature-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: #1a1a1a;
    }

    .status-badge {
        padding: 0.25rem 0.75rem;
        border-radius: 9999px;
        font-size: 0.875rem;
        font-weight: 500;
        text-transform: capitalize;
    }

    .client-section {
        margin-top: 1rem;
    }

    .client-title {
        font-size: 0.875rem;
        font-weight: 500;
        color: #666;
        margin-bottom: 0.5rem;
    }

    .client-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
    }

    .client-tag {
        background: #f3f4f6;
        padding: 0.25rem 0.75rem;
        border-radius: 9999px;
        font-size: 0.875rem;
        color: #4b5563;
    }

    .feature-footer {
        margin-top: 1rem;
        padding-top: 1rem;
        border-top: 1px solid #e5e7eb;
    }

    .feature-id {
        font-size: 0.875rem;
        color: #6b7280;
    }

    /* Status colors */
    :global(.bg-green-100) {
        background-color: #dcfce7;
    }

    :global(.text-green-800) {
        color: #166534;
    }

    :global(.bg-red-100) {
        background-color: #fee2e2;
    }

    :global(.text-red-800) {
        color: #991b1b;
    }
</style>
