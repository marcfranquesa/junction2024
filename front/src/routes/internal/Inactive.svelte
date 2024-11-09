<script>
	export let inactiveFeatures;
</script>

<div>
	<h2 class="mb-4 text-xl font-bold">Inactive Features</h2>

	{#if inactiveFeatures && inactiveFeatures.length > 0}
		<ul class="feature-list">
			{#each inactiveFeatures as feature}
				<li class="feature-item">
					<strong>{feature.tag}</strong> - Last update: {new Date(
						feature.updatesdatetime
					).toLocaleDateString()}
					<span>({feature.days_since_last_update} days ago)</span>
				</li>
			{/each}
		</ul>
	{:else}
		<p>No inactive features found.</p>
	{/if}
</div>

<style>
	.feature-list {
		list-style: none;
		padding: 0;
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
