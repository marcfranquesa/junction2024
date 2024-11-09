from typing import List, Optional

from fastapi import FastAPI, HTTPException, Query

# Initialize the FastAPI app
app = FastAPI()

# Dummy data for features and feature_backlog
dummy_features = [
    {
        "feature_id": 1,
        "name": "Feature A",
        "tag": "Tag 1",
        "client_list": "Client 1, Client 2",
        "status": "active",
        "description": "Feature A Description",
    },
    {
        "feature_id": 2,
        "name": "Feature B",
        "tag": "Tag 1",
        "client_list": "Client 3, Client 4",
        "status": "inactive",
        "description": "Feature B Description",
    },
    {
        "feature_id": 3,
        "name": "Feature C",
        "tag": "Tag 1",
        "client_list": "Client 5, Client 6",
        "status": "active",
        "description": "Feature C Description",
    },
    {
        "feature_id": 4,
        "name": "Feature D",
        "tag": "Tag 2",
        "client_list": "Client 7, Client 8",
        "status": "inactive",
        "description": "Feature D Description",
    },
    {
        "feature_id": 5,
        "name": "Feature E",
        "tag": "Tag 3",
        "client_list": "Client 9, Client 10",
        "status": "active",
        "description": "Feature E Description",
    },
]

dummy_backlog = {
    1: [
        {
            "backlog_id": 1,
            "status": "Change description 1",
            "timestamp": "2024-11-01T10:00:00",
        },
        {
            "backlog_id": 2,
            "status": "Change description 2",
            "timestamp": "2024-11-02T12:30:00",
        },
    ],
    2: [
        {
            "backlog_id": 3,
            "status": "Change description 3",
            "timestamp": "2024-11-01T14:00:00",
        },
        {
            "backlog_id": 4,
            "status": "Change description 4",
            "timestamp": "2024-11-03T16:00:00",
        },
    ],
    3: [
        {
            "backlog_id": 5,
            "status": "Change description 5",
            "timestamp": "2024-11-01T09:00:00",
        },
    ],
}


# Endpoint to return a list of features with optional filters
@app.get("/featurelists")
def feature_list(
    tag: Optional[str] = None,
    status: Optional[str] = None,
    user_id: Optional[int] = None,
):
    filtered_features: list[dict] = dummy_features

    # Apply tag filter
    if tag:
        filtered_features = [f for f in filtered_features if f["tag"] == tag]
    # Apply status filter
    if status:
        filtered_features = [f for f in filtered_features if f["status"] == status]
    # Dummy filter for user_id
    if user_id:
        filtered_features = [
            f
            for f in filtered_features
            if f"Client {user_id}" in f["client_list"].split(", ")
        ]

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
        **feature,
        "updates": updates,
    }
