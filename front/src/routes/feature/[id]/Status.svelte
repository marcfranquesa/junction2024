<script>
	export let status;
	let statusColor;

	if (status === 'backlog') statusColor = 'bg-gray-500';
	else if (status === 'in progress') statusColor = 'bg-yellow-500';
	else if (status === 'deployed') statusColor = 'bg-green-500';
</script>

<div class={`p-2 rounded ${statusColor} text-white font-bold`}>
	{status}
</div>
