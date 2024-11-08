export const load = async ({ params }) => {
	const features = {
		1: {
			name: 'Authentication',
			status: 'in progress',
			updates: ['Added OAuth support', 'Refined JWT token management'],
			description: 'Handles user authentication and authorization.'
		},
		2: {
			name: 'Data Sync',
			status: 'backlog',
			updates: ['Defined sync protocols', 'Started database modeling'],
			description: 'Synchronizes data across devices and platforms.'
		}
		// Afegeix més features aquí si cal
	};

	const feature = features[params.id];
	if (!feature) {
		return {
			status: 404,
			error: new Error('Feature not found')
		};
	}

	const email = 'user@example.com'; // Need to get it from current user data

	return { feature, email };
};
