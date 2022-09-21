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


class Rank(BaseModel):
    rank_id: int
    rank_name: str
    
    class Config:
        orm_mode = True

class Tel(BaseModel):
    tel_id: int
    tel_number: str
    tel_name: str
    
    class Config:
        orm_mode = True


class Client(BaseModel):
    client_id: int
    client_serial: int
    client_name: str
    client_zip: str = None
    tellist : List[Tel] = []
    rank: Rank

    class Config:
        orm_mode = True


class User(BaseModel):
    name:str
    email:str
    password:str

class Login(BaseModel):
    name:str
    email:str
    password:str

class Token(BaseModel):
    Authorization: str = None

class UserToken(BaseModel):
    sign_id: int
    sign_email: str = None
    sign_name: str = None
    sign_cellphone: str = None

    class Config:
        orm_mode = True


