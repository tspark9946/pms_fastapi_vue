from datetime import datetime, date
from enum import Enum
from typing import List, Optional
from pydantic import Field, EmailStr
from pydantic import BaseModel

from api.database.dbmodel import Rank

# Login, Auth
class User(BaseModel):
    sign_name:str
    sign_email: EmailStr
    sign_password:str
    sign_cellphone: str
    sign_license_number: Optional[str] = None
    sign_department: Optional[str] = None
    sign_jobtitle: Optional[str] = None

class Login(BaseModel):
    sign_email:EmailStr
    sign_password:str


class Token(BaseModel):
    Authorization: str = None

class UserToken(BaseModel):
    sign_id: int
    sign_email: str = None
    sign_name: str = None
    sign_cellphone: str = None
    hospital_id: int

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


# DB table
class Rank(BaseModel):
    rank_id: int
    rank_name: str
    
    class Config:
        orm_mode = True

class EditMode(Enum):
    Insert = 1
    Update = 2
    Delete = 3

class Tel(BaseModel):
    tel_id: int
    tel_number: str
    tel_name: str
    tel_default: int
    tel_type: int
    tel_allow_phone: Optional[int] = 0
    tel_allow_sms: Optional[int] = 0
    tel_allow_email: Optional[int] = 0
    created_sign_id: Optional[int] = None
    created_sign_name: Optional[str] = None
    modified_sign_id: Optional[int] = None
    modified_sign_name: Optional[str] = None
    editMode: EditMode = 1
    
    class Config:
        orm_mode = True


class Client(BaseModel):
    client_id: int = 0
    client_serial: int
    client_name: str
    client_zip: str = None
    tellist : Optional[List[Tel]] = []
    rank_id: Optional[int] = None
    rank: Optional[Rank] = None
    client_address1: Optional[str] = None
    client_address2: Optional[str] = None
    client_email: Optional[str] = None
    client_etc: Optional[str] = None
    client_alert: Optional[int] = 0
    client_firstdate: Optional[date] = None
    client_debt: Optional[float] = 0.0
    client_resmoney: Optional[float] = 0.0
    client_point: Optional[float] = 0.0
    client_memo1: Optional[str] = None
    client_memo1_encoded: Optional[str] = None
    client_memo2: Optional[str] = None
    client_memo2_encoded: Optional[str] = None
    client_state: Optional[int] = 0
    created_at: Optional[datetime] = None
    modified_at: Optional[datetime] = None 
    created_sign_id: Optional[int] = None
    created_sign_name: Optional[str] = None
    modified_sign_id: Optional[int] = None
    modified_sign_name: Optional[str] = None
    hospital_id: int

    class Config:
        orm_mode = True
        
class Species(BaseModel):
    species_id: int
    species_identifier: str
    
    class Config:
        orm_mode = True

class Sex(BaseModel):
    sex_id: int
    sex_identifier: str
    
    class Config:
        orm_mode = True

class Taxfreetype(BaseModel):
    taxfreetype_id: int
    taxfreetype_name: str
    
    class Config:
        orm_mode = True

class Pet(BaseModel):
    pet_id: int = 0
    pet_serial: int
    client_id: int = 0
    pet_name: str
    pet_rfid: Optional[str] = None
    pet_rfidtype: Optional[int] = 0
    pet_breed: Optional[str] = None
    species_id: Optional[int] = None
    species: Optional[Species] = None
    sex_id: Optional[int] = None
    sex: Optional[Sex] = None
    pet_color: Optional[str] = None
    pet_birth: Optional[date] = None
    pet_staff1: Optional[str] = None
    pet_staff2: Optional[str] = None
    pet_refer: Optional[str] = None
    pet_firstdate: Optional[date] = None
    pet_lastdate: Optional[date] = None
    pet_alert: Optional[int] = 0
    pet_feed: Optional[str] = None
    pet_default: Optional[int] = 0
    taxfreetype_id: Optional[int] = None
    taxfreetype: Optional[Taxfreetype] = None
    pet_memo1: Optional[str] = None
    pet_memo1_encoded: Optional[str] = None
    pet_memo2: Optional[str] = None
    pet_memo2_encoded: Optional[str] = None
    pet_state: Optional[int] = 0
    order_idx: Optional[int] = 0
    created_at: Optional[datetime] = None
    modified_at: Optional[datetime] = None 
    created_sign_id: Optional[int] = None
    created_sign_name: Optional[str] = None
    modified_sign_id: Optional[int] = None
    modified_sign_name: Optional[str] = None
    hospital_id: int = 0

    class Config:
        orm_mode = True






