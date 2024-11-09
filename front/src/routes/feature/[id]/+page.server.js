export const load = async ({ params }) => {
	const response = await fetch(`http://localhost:8000/feature/${params.id}`, {
		method: 'GET'
	});

	const feature = await response.json();

	return {
		feature,
		email: 'example@example.com' // Get it from the user
	};
};
