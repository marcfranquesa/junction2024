<script>
	import Plot from './Plot.svelte';
	import NewFeatures from './NewFeatures.svelte';

	export let data;
	const featureCounts = data.feature_counts.feature_counts;
	const newFeatures = data.new_features;
</script>

<div class="page-container">
	<h1 class="mb-4 text-2xl font-bold">Internal reporting</h1>

	<div class="chart-card">
		<Plot {featureCounts} />
	</div>

	<h1 class="mb-4 mt-8 text-2xl font-bold">New Features</h1>

	<div class="new-features">
		<NewFeatures {newFeatures} />
	</div>
</div>

<style>
	.page-container {
		padding: 2rem;
	}

	.grid-container {
		display: grid;
		grid-template-columns: 1fr;
		gap: 2rem;
	}

	/* A partir de mida mitjana (md), es mostren les columnes */
	@media (min-width: 768px) {
		.grid-container {
			grid-template-columns: 1fr 1fr;
		}
	}

	.chart-card {
		background-color: #ffffff;
		border-radius: 12px;
		padding: 2rem;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		transition:
			transform 0.2s ease,
			box-shadow 0.2s ease;
	}

	.chart-card:hover {
		transform: translateY(-2px);
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}

	.new-features {
		margin-top: 0; /* Elimina el marge extra quan es passa a dues columnes */
	}

	/* Text and utility styles */
	.text-2xl {
		font-size: 1.5rem;
	}

	.font-bold {
		font-weight: 700;
	}

	.mb-4 {
		margin-bottom: 1rem;
	}
</style>
