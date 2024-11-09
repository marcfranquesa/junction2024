import sqlite3 from 'sqlite3';
import path from 'path';

export const load = async ({ params }) => {
	// Creació de la connexió a la base de dades
	const dbPath = path.resolve('./src/routes/features.db');
	const db = new sqlite3.Database(dbPath, (err) => {
		if (err) {
			console.error('Failed to open database', err);
		}
	});

	// Funció per obtenir les dades de la feature
	const getFeature = new Promise((resolve, reject) => {
		db.get('SELECT * FROM features WHERE feature_id = ?', [params.id], (err, row) => {
			if (err) {
				reject(err);
			} else {
				resolve(row);
			}
		});
	});

	// Obtenir la feature
	const feature = await getFeature;
	if (!feature) {
		return {
			status: 404,
			error: new Error('Feature not found')
		};
	}

	const getUpdates = new Promise((resolve, reject) => {
		db.all(
			'SELECT * FROM feature_backlog WHERE feature_id = ? ORDER BY timestamp DESC',
			[params.id],
			(err, rows) => {
				if (err) {
					reject(err);
				} else {
					resolve(rows);
				}
			}
		);
	});
	const updates = await getUpdates;

	return {
		feature: {
			name: feature.tag,
			status: feature.status,
			description: feature.description,
			updates: updates
		},
		email: 'example@example.com' // Get it from the user
	};
};
