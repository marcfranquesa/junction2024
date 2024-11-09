export const load = async ({ params }) => {
	const client = {
		id: 101,
		email: 'example@example.com' // Get it from the user
	};

	const response = await fetch(`http://localhost:8000/featurelists?user_id=${client.id}`, {
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
		features,
		client
	};
};
