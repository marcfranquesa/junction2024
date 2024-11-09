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
					<span class="text-sm text-gray-500">{update.timestamp.substring(0, 10)}</span>
				</li>
			{/each}
		</ul>
	</div>

	<!-- Mail form -->
	<form on:submit|preventDefault={submitMessage} class="space-y-4">
		<h2 class="text-xl font-semibold">
			<span class="text-base font-medium">Any doubt or suggestion?</span><br />Leave a message
		</h2>

		<input
			bind:value={subject}
			type="text"
			placeholder="Subject"
			class="w-full rounded border p-2"
		/>

		<textarea
			bind:value={message}
			rows="4"
			placeholder="Write your message here..."
			class="w-full resize-none rounded border p-2"
		></textarea>

		<button type="submit" class="rounded bg-blue-500 px-4 py-2 text-white hover:bg-blue-600">
			Send
		</button>
	</form>
</div>

<style>
	/* Add if needed */
</style>
