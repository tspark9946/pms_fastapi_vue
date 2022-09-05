from datetime import datetime

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from sqlalchemy.orm import Session
from api.database.conn import db


router = APIRouter()


@router.get("/client")
async def index(session: Session = Depends(db.session),):
    """
    ELB 상태 체크용 API
    :return:
    """
    
    
    current_time = datetime.utcnow()
    return Response(f"Notification API ")
