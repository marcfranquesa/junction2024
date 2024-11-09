<script>
	export let data;

	const feature = data.feature;

	let subject = '';
	let message = '';

	$: statusColor =
		feature.status === 'active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800';

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
	<div class="feature-card">
		<!-- Header (name and status) -->
		<div class="feature-header">
			<h2 class="feature-title">{feature.name}</h2>
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

        <a href="/pdfs/{feature.pdf}.pdf" target="_blank">
            <div class="pdf-link">
                PDF
            </div>
        </a>

		<div class="feature-footer">
			<span class="feature-id">ID: {feature.feature_id}</span>
		</div>

		<div class="feature-footer">
			<h2 class="mb-2 text-xl font-semibold text-black">Latest Updates</h2>
			<ul class="space-y-2">
				{#each data.feature.updates as update}
					<li class="update-item flex items-center space-x-2">
						<!-- Timestamp styling -->
						<span class="text-base text-gray-500"
							>{update.timestamp.substring(0, 10)}</span
						>

						<span>{update.status}</span>
					</li>
				{/each}
			</ul>
		</div>
	</div>

	<!-- Mail form -->
	<div class="feature-card">
		<div class="mb-4">
			<h2 class="text-xl font-semibold text-black">Any doubt or suggestions?</h2>
			<p class="text-base font-medium">Leave us a message and we will get you via mail.</p>
		</div>
		<form on:submit|preventDefault={submitMessage} class="space-y-4">
			<div class="input-container">
				<input
					bind:value={subject}
					type="text"
					placeholder="Subject"
					class="input mb-2 w-full rounded"
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
    .pdf-link {
      display: inline-block;
      padding: 0.5rem 1rem;
      font-size: 1rem;
      font-weight: 600;
      color: #2563eb; /* Blue color */
      background-color: #f0f9ff; /* Light blue background */
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.2s ease, color 0.2s ease, transform 0.2s ease;
    }

    .pdf-link:hover {
      background-color: #2563eb; /* Darker blue background on hover */
      color: #ffffff; /* White text on hover */
      transform: translateY(-2px); /* Subtle upward movement */
    }

    .pdf-link:active {
      transform: translateY(0); /* Return to normal position on click */
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

	.feature-header {
		margin-bottom: 0.75rem;
	}

	.feature-title {
		font-size: 1.75rem;
		font-weight: 600;
		color: #1a1a1a;
		display: flex;
		align-items: center;
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
		font-size: 1.25rem;
		font-weight: 500;
		text-transform: capitalize;
	}

	.tag-tag {
		padding: 0.25rem 0.75rem;
		border-radius: 9999px;
		font-size: 1.25rem;
	}

	.feature-description {
		font-size: 1rem;
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

	/* Input container for consistent form styling */
	.input-container {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}

	/* Input styling for both text and textarea */
	.input {
		width: 100%;
		padding: 0.75rem 1rem;
		font-size: 1rem;
		border: 2px solid #e5e7eb;
		border-radius: 8px;
		outline: none;
		transition:
			border-color 0.2s ease,
			box-shadow 0.2s ease;
		background-color: #f9fafb;
		color: #1f2937;
	}

	/* Focused input styling */
	.input:focus {
		border-color: #2563eb;
		box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
		background-color: #ffffff;
	}
</style>
