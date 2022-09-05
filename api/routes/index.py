from datetime import datetime
from unicodedata import name

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from inspect import currentframe as frame

from sqlalchemy.orm import Session
from api.database.conn import db
from api.database.schema import Client

router = APIRouter()


@router.get("/")
async def index(session: Session = Depends(db.session),):
    """
    ELB 상태 체크용 API
    :return:
    """
    Client().create(session, auto_commit=True, client_name="홍길동2", rank_id=1, client_serial=3, hospital_id=1)
    
    current_time = datetime.utcnow()
    return Response(f"Notification API (UTC: {current_time.strftime('%Y.%m.%d %H:%M:%S')})")
