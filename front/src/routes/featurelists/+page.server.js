import sqlite3 from 'sqlite3';
import path from 'path';


export const load = async ({ params }) => {
	const dbPath = path.resolve('./src/routes/features.db');
	const db = new sqlite3.Database(dbPath, (err) => {
		if (err) {
			console.error('Failed to open database', err);
		}
	});
	const getFeatures = new Promise((resolve, reject) => {
		db.all('SELECT * FROM features', [], (err, row) => {
			if (err) {
				reject(err);
			} else {
				resolve(row);
			}
		});
	});
	// Obtenir la feature
	const features = await getFeatures;
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
