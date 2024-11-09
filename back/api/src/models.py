from datetime import datetime

from sqlmodel import Field, SQLModel


class Features(SQLModel, table=True):
    feature_id: int = Field(primary_key=True)
    name: str = Field(index=True)
    tag: str = Field(index=True)
    description: str = Field(index=True)
    status: str


class Feature_Users(SQLModel, table=True):
    feature_id: int = Field(foreign_key="features.feature_id", primary_key=True)
    user_id: int = Field(primary_key=True)


class Feature_Backlog(SQLModel, table=True):
    feature_id: int = Field(foreign_key="features.feature_id", primary_key=True)
    status: str
    timestamp: datetime = Field(primary_key=True)

