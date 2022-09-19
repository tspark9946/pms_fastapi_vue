from datetime import datetime
from enum import Enum
from typing import List, Optional

from pydantic import Field
from pydantic import BaseModel

from api.database.dbmodel import Rank


#예제용 모델
class Blog(BaseModel):
    title: str
    body: str
    published_at: Optional[bool]


class RankModel(BaseModel):
    rank_id: int
    rank_name: str
    
    class Config:
        orm_mode = True

class TelModel(BaseModel):
    tel_id: int
    tel_number: str
    tel_name: str
    
    class Config:
        orm_mode = True


class ClientModel(BaseModel):
    client_id: int
    client_serial: int
    client_name: str
    client_zip: str = None
    tellist : List[TelModel] = []
    rank: RankModel

    class Config:
        orm_mode = True


