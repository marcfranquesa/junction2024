from typing import List, Optional

from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy import case, func, select
from sqlmodel import Session, SQLModel
from src import db
from src import models as m

app = FastAPI()


@app.get("/")
async def index():
    return {"Hello": db.DATABASE_URL}


@app.get("/featurelists")
def feature_list(
    *,
    session: Session = Depends(db.get_session),
    tag: Optional[str] = None,
    status: Optional[str] = None,
    user_id: Optional[int] = None,
):
    query = select(m.Features)

    if tag:
        query = query.where(m.Features.tag == tag)
    if status:
        query = query.where(m.Features.status == status)

    if user_id:
        # Aggregate the "following" status by taking the MAX, which will give us 1 if the user is following
        case_when = case((m.Feature_Users.user_id == user_id, 1), else_=0).label(
            "user_status"
        )

        query = (
            select(m.Features, func.max(case_when).label("following"))
            .distinct()
            .join(
                m.Feature_Users,
                m.Feature_Users.feature_id == m.Features.feature_id,
                isouter=True,
            )
            .group_by(m.Features.feature_id)  # Group by feature_id to avoid duplicates
        )

    features = session.exec(query).all()

    return [
        {
            "feature_id": feature[0].feature_id,
            "name": feature[0].name,
            "tag": feature[0].tag,
            "description": feature[0].description,
            "status": feature[0].status,
            "following": feature[1] if user_id else 0,
        }
        for feature in features
    ]


@app.get("/feature/{feature_id}")
def feature_detail(
    *,
    session: Session = Depends(db.get_session),
    feature_id: int,
):
    feature_query = select(m.Features).where(m.Features.feature_id == feature_id)
    feature = session.exec(feature_query).first()[0]

    if not feature:
        return {"error": "Feature not found"}, 404

    updates_query = select(m.Feature_Backlog).where(
        m.Feature_Backlog.feature_id == feature_id
    )
    updates = session.exec(updates_query).all()

    return {
        "feature_id": feature.feature_id,
        "name": feature.name,
        "tag": feature.tag,
        "description": feature.description,
        "status": feature.status,
        "pdf": feature.pdf,
        "updates": [
            {"timestamp": update[0].timestamp, "status": update[0].status}
            for update in updates
        ],
    }


@app.get("/users-per-feature")
def feature_detail(
    *,
    session: Session = Depends(db.get_session),
):
    query = select(m.Feature_Users.feature_id)
    result = session.execute(query).all()

    features_query = select(m.Features.feature_id, m.Features.name)
    features_result = session.execute(features_query).all()
    features_dict = {feature[0]: feature[1] for feature in features_result}

    feature_counts = {}
    for feature_tuple in result:
        feature = feature_tuple[0]
        if feature not in feature_counts:
            feature_counts[feature] = 0
        feature_counts[feature] += 1

    feature_counts_list = sorted(
        [
            {"name": features_dict[feature], "userCount": count}
            for feature, count in feature_counts.items()
        ],
        key=lambda x: x["userCount"],
        reverse=True,
    )

    return {"feature_counts": feature_counts_list}
