import json
from pydantic import BaseModel, Field
from typing import Dict

from app.service.firebase_service import get_firestore

class GlobalPostMetrics(BaseModel):
    totalPosts: int = Field(0, alias="totalPosts")
    activePosts: int = Field(0, alias="activePosts")
    archivedPosts: int = Field(0, alias="archivedPosts")
    totalViews: int = Field(0, alias="totalViews")
    totalUniqueViews: int = Field(0, alias="totalUniqueViews")
    totalLikes: int = Field(0, alias="totalLikes")
    totalComments: int = Field(0, alias="totalComments")
    totalShares: int = Field(0, alias="totalShares")
    averageEngagementRate: float = Field(0.0, alias="averageEngagementRate")
    averageReadTime: float = Field(0.0, alias="averageReadTime")
    averageInteractionRate: float = Field(0.0, alias="averageInteractionRate")
    postsByCategory: Dict[str, int] = Field(default_factory=dict, alias="postsByCategory")
    postsByTag: Dict[str, int] = Field(default_factory=dict, alias="postsByTag")
    totalUniqueAuthors: int = Field(0, alias="totalUniqueAuthors")
    totalUniqueInteractors: int = Field(0, alias="totalUniqueInteractors")
    postsByMonth: Dict[str, int] = Field(default_factory=dict, alias="postsByMonth")
    postsByYear: Dict[str, int] = Field(default_factory=dict, alias="postsByYear")
    globalViralityScore: float = Field(0.0, alias="globalViralityScore")
    globalRecommendationScore: float = Field(0.0, alias="globalRecommendationScore")
    audienceSegmentEngagement: Dict[str, float] = Field(default_factory=dict, alias="audienceSegmentEngagement")

    class Config:
        allow_population_by_field_name = True


def main():

    firestore = get_firestore()
    globalPostMetrics = GlobalPostMetrics(
    totalPosts=3,
    activePosts=3,
    archivedPosts=0,
    totalViews=0,
    totalUniqueViews=0,
    totalLikes=0,
    totalComments=0,
    totalShares=0,
    averageEngagementRate=0.0,
    averageReadTime=0.0,
    averageInteractionRate=0.0,
    postsByCategory={},
    postsByTag={},
    totalUniqueAuthors=0,
    totalUniqueInteractors=0,
    postsByMonth={},
    postsByYear={},
    globalViralityScore=0.0,
    globalRecommendationScore=0.0,
    audienceSegmentEngagement={}
)
    

    metrics_dict = globalPostMetrics.dict(by_alias=True)
    metrics_json = json.dumps(metrics_dict)
    firestore.collection('global-post-metrics').document().set(json.loads(metrics_json))
