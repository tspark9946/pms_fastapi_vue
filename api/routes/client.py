from datetime import datetime
from http.client import HTTPException
from sys import prefix
from typing import List
from loguru import logger

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from sqlalchemy.orm import Session

from ..database.conn import db
from ..database.dbmodel import Client
from ..database import crud
from ..models import schemas


router = APIRouter(prefix="/client", tags=["client"])


@router.get("/", response_model=List[schemas.ClientModel])
def read_clients(skip: int = 0, limit: int = 100, db: Session = Depends(db.session)):
    logger.info("client router start")
    clients = crud.get_clients(db, skip, limit)
    return clients


@router.get("/{client_id}", response_model=schemas.ClientModel)
async def read_client(id: int):
    client = crud.get_client(id)
    if client is None:
        raise HTTPException(status_code=404, detail="Client not found")
    return client
