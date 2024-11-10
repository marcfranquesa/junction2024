<script>
	export let status;
	let statusColor;

	if (status === 'new') statusColor = 'bg-gray-500';
	else if (status === 'modified') statusColor = 'bg-orange-500';
	else if (status === 'existing') statusColor = 'bg-green-500';
</script>

<div
	class={`rounded p-2 ${statusColor} flex min-w-64 items-center justify-center font-bold text-white`}
>
	<p>{status}</p>
</div>
