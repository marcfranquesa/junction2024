<script>
	export let status;
	let statusColor;

	if (status === 'inactive') statusColor = 'bg-gray-500';
	else if (status === 'active') statusColor = 'bg-green-500';
</script>

<div
	class={`rounded p-2 ${statusColor} flex min-w-64 items-center justify-center font-bold text-white`}
>
	<p>{status}</p>
</div>
