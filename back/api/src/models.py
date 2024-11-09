from datetime import datetime

from sqlmodel import Field, SQLModel


class Features(SQLModel, table=True):
    feature_id: int = Field(primary_key=True)
    tag: str = Field(index=True)  # Index for faster lookups if needed
    status: str


class Feature_Users(SQLModel, table=True):
    feature_id: int = Field(foreign_key="features.feature_id", primary_key=True)
    user_id: int = Field(primary_key=True)


class Feature_Backlog(SQLModel, table=True):
    feature_id: int = Field(foreign_key="features.feature_id", primary_key=True)
    status: str
    description: str
    timestamp: datetime = Field(primary_key=True)

