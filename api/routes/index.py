from datetime import datetime
from symbol import try_stmt
from typing import Optional
from unicodedata import name
from loguru import logger

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from fastapi.requests import Request
from inspect import currentframe as frame

from sqlalchemy.orm import Session
from ..database.conn import db
from ..models import schemas

router = APIRouter()


@router.get("/")
async def index():
    """
    ELB 상태 체크용 API
    :return:
    """
    
    
    current_time = datetime.utcnow()
    return Response(f"Notification API (UTC: {current_time.strftime('%Y.%m.%d %H:%M:%S')})")

@router.get("/test")
async def test(request: Request):
    """
    ELB 상태 체크용 API
    :return:
    """
    print("state.user", request.state.user)
    logger.debug("test router start")
    try:
        a = 1/0
    except Exception as e:
        request.state.inspect = frame()
        raise e
    
    current_time = datetime.utcnow()
    return Response(f"Notification API (UTC: {current_time.strftime('%Y.%m.%d %H:%M:%S')})")

