import * as config from "../../../config";

export const load = async ({ params }) => {
	const response = await fetch(`${config.db_host}/feature/${params.id}`, {
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
