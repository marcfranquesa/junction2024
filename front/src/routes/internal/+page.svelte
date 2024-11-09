<script>
	import { onMount } from 'svelte';
	import {
		Chart,
		BarController,
		CategoryScale,
		LinearScale,
		BarElement,
		Tooltip,
		Legend
	} from 'chart.js';

	export let data;
	const featureCounts = data.feature_counts.feature_counts;

	Chart.register(BarController, CategoryScale, LinearScale, BarElement, Tooltip, Legend);

	let featureChart;

	const labels = featureCounts.map((f) => f.name);
	const chart_data = {
		labels,
		datasets: [
			{
				label: 'Users watching the Feature',
				data: featureCounts.map((f) => f.userCount),
				backgroundColor: '#2563eb',
				borderRadius: 8,
				barPercentage: 0.8
			}
		]
	};

	console.log(labels);
	console.log(featureCounts.map((f) => f.userCount));

	const options = {
		responsive: true,
		scales: {
			y: {
				beginAtZero: true,
				ticks: {
					color: '#6b7280',
					stepSize: 1
				},
				grid: {
					color: '#e5e7eb'
				}
			},
			x: {
				ticks: {
					color: '#6b7280'
				},
				grid: {
					display: false
				}
			}
		},
		plugins: {
			legend: {
				position: 'top',
				labels: {
					color: '#1f2937'
				}
			},
			tooltip: {
				backgroundColor: '#2563eb'
			}
		}
	};

	onMount(() => {
		const ctx = document.getElementById('featureChart').getContext('2d');
		featureChart = new Chart(ctx, {
			type: 'bar',
			data: chart_data,
			options
		});
	});
</script>

<div class="page-container">
	<h1 class="mb-4 text-2xl font-bold">Feature Relevance Statistics</h1>

	<div class="chart-card">
		<canvas id="featureChart"></canvas>
	</div>
</div>

<style>
	.page-container {
		padding: 2rem;
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
