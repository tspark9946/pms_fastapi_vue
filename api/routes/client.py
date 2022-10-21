from datetime import datetime
from typing import List
from urllib import request
from loguru import logger

from fastapi import APIRouter, Depends, status, HTTPException
from fastapi.responses import Response
from fastapi.requests import Request
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
async def read_client_by_id(client_id: int, db: Session = Depends(db.session)):
    client = crud.get_client(db, client_id)
    if client is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Client not found")
    logger.info("get client before return")
    return client


@router.post("/", status_code=status.HTTP_201_CREATED, response_model=schemas.Client)
def create_client(clientInfo: schemas.Client, request: Request, db: Session = Depends(db.session)):
#   print(request.url)
#   print(request.client.host)
#   print(request.state.user)
    user = request.state.user
    clientInfo.created_sign_id = user.sign_id
    clientInfo.created_sign_name = user.sign_name
    clientInfo.modified_sign_id = user.sign_id
    clientInfo.modified_sign_name = user.sign_name
    clientInfo.hospital_id = user.hospital_id

    new_client = crud.create_client(db, clientInfo)
    if new_client is None:
      raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Client insert failed")

    return new_client

@router.put("/", status_code=status.HTTP_202_ACCEPTED, response_model=schemas.Client)
def modify_client(clientInfo: schemas.Client, request: Request, db: Session = Depends(db.session)):
    user = request.state.user
    clientInfo.modified_sign_id = user.sign_id
    clientInfo.modified_sign_name = user.sign_name
    clientInfo.hospital_id = user.hospital_id

    client = crud.update_client(db, clientInfo)
    if client is None:
      raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Client insert failed")

    return client

@router.delete('/{client_id}', status_code=status.HTTP_204_NO_CONTENT)
def delete_client(client_id: int, db: Session = Depends(db.session)):
    """ Not correct working """
    return crud.delete_client(db, client_id)


