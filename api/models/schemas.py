from datetime import datetime
from enum import Enum
from typing import List, Optional

from pydantic import Field
from pydantic import BaseModel


#예제용 모델
class Blog(BaseModel):
    title: str
    body: str
    published_at: Optional[bool]


class ClientModel(BaseModel):
    client_id: int
    client_serial: int
    client_name: str
    client_zip: str = None

    class Config:
        orm_mode = True


