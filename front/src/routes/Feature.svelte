<script>
    export let feature;

    $: statusColor = feature.status === 'active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800';
    $: starIcon = feature.following === 1 ? '★' : '☆';  // Full star if following, empty star otherwise
</script>

<a href="/feature/{feature.feature_id}" class="feature-link">
    <div class="feature-card">
        <div class="feature-header">
            <h2 class="feature-title">
                {feature.name}
                <span class="star-icon">
                    {starIcon} <!-- This is where the star is dynamically added -->
                </span>
            </h2>
        </div>

        <div class="tag-status-row">
            <div class="tags-group">
                <span class="tag-tag bg-blue-100 text-blue-800">
                    {feature.tag}
                </span>
                <span class="status-badge {statusColor}">
                    {feature.status}
                </span>
            </div>
        </div>

        <div class="feature-description">
            {feature.description}
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
        transition:
            transform 0.2s ease,
            box-shadow 0.2s ease;
    }

    .feature-link:hover .feature-card {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .feature-header {
        margin-bottom: 0.75rem;
    }

    .feature-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: #1a1a1a;
        display: flex;
        align-items: center;
    }

    .star-icon {
        font-size: 1.5rem;
        color: #ffcc00;  /* Yellow color for filled star */
        margin-left: 0.5rem;
    }

    .tag-status-row {
        margin-bottom: 1rem;
    }

    .tags-group {
        display: flex;
        gap: 0.5rem;
        align-items: center;
    }

    .status-badge {
        padding: 0.25rem 0.75rem;
        border-radius: 9999px;
        font-size: 0.875rem;
        font-weight: 500;
        text-transform: capitalize;
    }

    .tag-tag {
        padding: 0.25rem 0.75rem;
        border-radius: 9999px;
        font-size: 0.875rem;
    }

    .feature-description {
        font-size: 0.875rem;
        color: #4b5563;
        line-height: 1.5;
        margin-bottom: 1rem;
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

    :global(.bg-blue-100) {
        background-color: #dbeafe;
    }

    :global(.text-blue-800) {
        color: #1e40af;
    }
</style>

