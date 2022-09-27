from datetime import datetime
from enum import Enum
from typing import List, Optional

from pydantic import Field
from pydantic import BaseModel

from api.database.dbmodel import Rank


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
    sign_name:str
    sign_email:str
    sign_password:str
    sign_cellphone: str

class Login(BaseModel):
    sign_email:str
    sign_password:str


class Token(BaseModel):
    Authorization: str = None

class UserToken(BaseModel):
    sign_id: int
    sign_email: str = None
    sign_name: str = None
    sign_cellphone: str = None

    class Config:
        orm_mode = True

class AddApiKey(BaseModel):
    user_memo: str = None

    class Config:
        orm_mode = True


class GetApiKeyList(AddApiKey):
    apikeys_id: int = None
    access_key: str = None
    created_at: datetime = None


class GetApiKeys(GetApiKeyList):
    secret_key: str = None


class CreateAPIWhiteLists(BaseModel):
    ip_addr: str = None


class GetAPIWhiteLists(CreateAPIWhiteLists):
    apiwhitelists_id: int

    class Config:
        orm_mode = True

class MessageOk(BaseModel):
    message: str = Field(default="OK")


