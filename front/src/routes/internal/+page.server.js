import * as config from '../../config';

export const load = async ({ params }) => {
	const response = await fetch(`${config.db_host}/users-per-feature`, {
		method: 'GET'
	});

	const feature_counts = await response.json();

	const inactive_features_response = await fetch(
		`${config.db_host}/featurelists?status=inactive`
	);

	const inactive_features = await inactive_features_response.json();

	return {
		feature_counts: feature_counts,
		inactive_features: inactive_features
	};
};
