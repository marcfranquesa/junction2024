import * as config from '../../config';

export const load = async ({ params }) => {
	const response = await fetch(`${config.db_host}/users-per-feature`, {
		method: 'GET'
	});

	const feature_counts = await response.json();

	const new_features_response = await fetch(`${config.db_host}/featurelists?status=new`);

	const new_features = await new_features_response.json();

	return {
		feature_counts: feature_counts,
		new_features: new_features
	};
};
