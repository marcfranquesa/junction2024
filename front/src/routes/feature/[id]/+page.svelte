<script>
	import Status from './Status.svelte';
	export let data;

	let subject = '';
	let message = '';

	const submitMessage = () => {
		alert(`Message submitted:
        - Subject: ${subject}
        - Message: ${message}
        - From: ${data.client.email}`);

		// Reset content
		subject = '';
		message = '';
	};
</script>

<div class="w-full space-y-6 p-4">
	<div class="card">
		<!-- Header (name and status) -->
		<div class="flex items-center justify-between">
			<h1 class="text-3xl font-bold">{data.feature.name}</h1>
			<Status status={data.feature.status} />
		</div>

		<!-- Feature content (Description and updates) -->
		<div>
			<h2 class="text-xl font-semibold">Description</h2>
			<p>{data.feature.description}</p>

			<h2 class="mt-4 text-xl font-semibold">Latest Updates</h2>
			<ul class="space-y-2 pl-5">
				{#each data.feature.updates as update}
					<li class="flex items-center space-x-2">
						<span class="font-semibold">{update.status}</span>

						<!-- Timestamp styling -->
						<span class="text-sm text-gray-500"
							>{update.timestamp.substring(0, 10)}</span
						>
					</li>
				{/each}
			</ul>
		</div>
	</div>

	<!-- Mail form -->
	<div class="card">
		<form on:submit|preventDefault={submitMessage} class="space-y-4">
			<h2 class="text-xl font-semibold">Any doubt or suggestion?</h2>
			<p class="text-base font-medium">Leave us a message and we will get you via mail.</p>

			<div class="input-container">
				<input
					bind:value={subject}
					type="text"
					placeholder="Subject"
					class="input w-full rounded"
				/>

				<textarea
					bind:value={message}
					rows="4"
					placeholder="Write your message here..."
					class="input w-full resize-none rounded"
				></textarea>

				<button
					type="submit"
					class="rounded bg-blue-500 px-4 py-2 text-white hover:bg-blue-600"
				>
					Send
				</button>
			</div>
		</form>
	</div>
</div>

<style>
	.card {
		background: white;
		border-radius: 12px;
		padding: 1.5rem;
	}

	.input-container {
		position: relative;
		margin-bottom: 1.5rem;
	}

	.input {
		width: 100%;
		padding: 0.75rem 1rem;
		padding-right: 2.5rem;
		font-size: 1rem;
		border: 2px solid #e5e7eb;
		border-radius: 8px;
		outline: none;
		transition:
			border-color 0.2s ease,
			box-shadow 0.2s ease;
	}

	.input:focus {
		border-color: #2563eb;
		box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
	}
</style>
