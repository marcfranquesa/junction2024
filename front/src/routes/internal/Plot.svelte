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

	export let featureCounts;
	featureCounts = featureCounts.slice(0, 8);

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
				backgroundColor: '#798ae0'
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

<div>
	<h2 class="mb-4 text-xl font-bold">Feature Relevance Statistics</h2>

	<canvas id="featureChart"></canvas>
</div>
