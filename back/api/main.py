from typing import List, Optional

from fastapi import FastAPI, HTTPException, Query

# Initialize the FastAPI app
app = FastAPI()

# Dummy data for features and feature_backlog
dummy_features = [
    {"feature_id": 1, "tag": "Feature A", "status": "active"},
    {"feature_id": 2, "tag": "Feature B", "status": "inactive"},
    {"feature_id": 3, "tag": "Feature C", "status": "active"},
    {"feature_id": 4, "tag": "Feature D", "status": "inactive"},
    {"feature_id": 5, "tag": "Feature E", "status": "active"},
]

dummy_backlog = {
    1: [
        {
            "backlog_id": 1,
            "status": "backlog",
            "description": "Update 123",
            "timestamp": "2024-11-01T10:00:00",
        },
        {
            "backlog_id": 2,
            "status": "in progress",
            "description": "Update 456",
            "timestamp": "2024-11-02T12:30:00",
        },
    ],
    2: [
        {
            "backlog_id": 3,
            "status": "backlog",
            "description": "Update 789",
            "timestamp": "2024-11-01T14:00:00",
        },
        {
            "backlog_id": 4,
            "status": "deployed",
            "description": "Update 123",
            "timestamp": "2024-11-03T16:00:00",
        },
    ],
    3: [
        {
            "backlog_id": 5,
            "status": "backlog",
            "description": "Update 456",
            "timestamp": "2024-11-01T09:00:00",
        },
    ],
}


# Endpoint to return a list of features with optional filters
@app.get("/featurelist")
def feature_list(
    tag: Optional[str] = None,
    status: Optional[str] = None,
    user_id: Optional[int] = None,
):
    filtered_features = dummy_features

    # Apply tag filter
    if tag:
        filtered_features = [f for f in filtered_features if f["tag"] == tag]
    # Apply status filter
    if status:
        filtered_features = [f for f in filtered_features if f["status"] == status]
    # Dummy filter for user_id
    if user_id:
        # For this dummy data, assume user_id filtering isn't implemented and return all features
        pass

    return filtered_features


# Endpoint to return a specific feature by ID with backlog updates
@app.get("/feature/{feature_id}")
def feature_detail(feature_id: int, limit: Optional[int] = None):
    # Find the feature with the given feature_id
    feature = next((f for f in dummy_features if f["feature_id"] == feature_id), None)
    if not feature:
        raise HTTPException(status_code=404, detail="Feature not found")

    # Get updates for the specified feature_id
    updates = dummy_backlog.get(feature_id, [])
    # Apply limit if provided
    if limit:
        updates = updates[:limit]

    # Include updates in the response
    return {
        "feature_id": feature["feature_id"],
        "tag": feature["tag"],
        "status": feature["status"],
        "updates": updates,
    }
