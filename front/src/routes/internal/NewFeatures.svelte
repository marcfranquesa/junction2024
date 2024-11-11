<script>
	import Feature from '../features/Feature.svelte';
	export let newFeatures;
</script>

<div>
	<div class="features-list">
		{#each newFeatures as feature (feature.feature_id)}
			<Feature {feature} />
		{/each}

		{#if newFeatures && newFeatures.length === 0}
			<div class="no-results">
				<p>No new features found.</p>
			</div>
		{/if}
	</div>
</div>

<style>
	.features-list {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		max-height: 80vh;
		overflow-y: auto;
		padding-right: 1rem;
	}

	.feature-item {
		background: #f9fafb;
		padding: 1rem;
		margin-bottom: 0.5rem;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.text-xl {
		font-size: 1.25rem;
	}

	.font-bold {
		font-weight: 700;
	}

	.mb-4 {
		margin-bottom: 1rem;
	}
</style>
