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

	// Funció per obtenir les actualitzacions (backlog)
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

	// Obtenir els updates
	const updates = await getUpdates;
	console.log(updates);

	// Retornar les dades a la pàgina
	return {
		feature: {
			name: feature.tag,
			status: feature.status,
			description: 'Placeholder description for now', // Potser vols substituir per més dades
			updates: updates.map((update) => update.status) // Afegeix més camps segons calgui
		},
		email: 'example@example.com' // Get it from the user
	};
};
