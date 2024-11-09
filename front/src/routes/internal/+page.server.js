export const load = async ({ params }) => {
	const response = await fetch('http://localhost:8000/users-per-feature', {
		method: 'GET'
	});

	const feature_counts = await response.json();

	return {
		feature_counts: feature_counts
	};
};
