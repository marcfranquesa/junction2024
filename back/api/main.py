from typing import List, Optional

from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy import select, case
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
        case_when = case(
            (m.Feature_Users.user_id.is_(None), 1),
            else_=0
        ).label("user_status")

        query = (
            select(m.Features, case_when)
            .distinct()  # Move distinct here after the join
            .join(
                m.Feature_Users, 
                m.Feature_Users.feature_id == m.Features.feature_id, 
                isouter=True
            )
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
    query = select(m.Feature_Backlog).where(m.Feature_Backlog.feature_id == feature_id)
    features = session.exec(query).all()

    return [
        {
            "feature_id": feature.feature_id,
            "status": feature.status,
            "timestamp": feature.timestamp,
        }
        for feature, in features
    ]
