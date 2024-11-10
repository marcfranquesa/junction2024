export const load = async ({ params }) => {
	const response = await fetch(`http://api/users-per-feature`, {
		method: 'GET'
	});

	const feature_counts = await response.json();

	const new_features_response = await fetch(`http://api/featurelists?status=new`);

	const new_features = await new_features_response.json();

	return {
		feature_counts: feature_counts,
		new_features: new_features
	};
};
