export const load = async ({ params }) => {
	const response = await fetch(`http://api/feature/${params.id}`, {
		method: 'GET'
	});

	const feature = await response.json();

	return {
		feature,
		client: {
			id: 101,
			email: 'example@example.com' // Get it from the user
		}
	};
};
