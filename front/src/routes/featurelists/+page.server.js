export const load = async ({ params }) => {
	const response = await fetch('http://localhost:8000/featurelists', {
		method: 'GET'
	});
	const features = await response.json();
	if (!features) {
		return {
			status: 404,
			error: new Error('Feature not found')
		};
	}

	return {
		features
	};
};
