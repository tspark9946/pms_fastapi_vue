from datetime import datetime
from sys import prefix
from typing import List
from loguru import logger

from fastapi import APIRouter, Depends, status, HTTPException
from fastapi.responses import Response
from sqlalchemy.orm import Session

from ..database.conn import db
from ..database.dbmodel import Client
from ..database import crud
from ..models import schemas


router = APIRouter(prefix="/client", tags=["Client"])


@router.get("/", response_model=List[schemas.Client])
def read_clients(skip: int = 0, limit: int = 100, db: Session = Depends(db.session)):
    """
        `전체 고객`\n
        :param session:\n
        :param auto_commit: 자동 커밋 여부\n
        :param kwargs: 적재 할 데이터\n
        :return:
        """
    logger.info("client router start")
    clients = crud.get_clients(db, skip, limit)
    return clients


@router.get("/{client_id}", response_model=schemas.Client)
async def read_client(id: int, db: Session = Depends(db.session)):
    client = crud.get_client(db, id)
    if client is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Client not found")
    return client
