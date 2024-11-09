import * as config from "../config";

// +page.server.js
export const load = async ({ params }) => {
    const client = {
        id: 101,
        email: 'example@example.com'
    };

    try {
        const response = await fetch(`${config.db_host}/featurelists?user_id=${client.id}`, {
            method: 'GET'
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const features = await response.json();

        return {
            features,
            client
        };
    } catch (error) {
        console.error('Error fetching feature list:', error);
        return {
            features: [], // Provide empty array as fallback
            client,
            error: 'Server error occurred while fetching feature list'
        };
    }
};
