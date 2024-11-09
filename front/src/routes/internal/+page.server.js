export const load = async ({ params }) => {
	const response = await fetch(`http://api/users-per-feature`, {
		method: 'GET'
	});

	const feature_counts = await response.json()['feature_counts'];

	return {
		feature_counts
	};
};
