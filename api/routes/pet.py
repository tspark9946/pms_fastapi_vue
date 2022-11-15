from datetime import datetime
from typing import List, Optional
from urllib import request
from loguru import logger

from fastapi import APIRouter, Depends, status, HTTPException
from fastapi.responses import Response
from fastapi.requests import Request
from sqlalchemy.orm import Session

from ..database.conn import db
from ..database import crud
from ..models import schemas


router = APIRouter(prefix="/pet", tags=["Pet"])


@router.get("/", response_model=List[schemas.Pet])
def read_pets(skip: int = 0, limit: int = 100, db: Session = Depends(db.session)):
    """
        `전체 고객`\n
        :param session:\n
        :param auto_commit: 자동 커밋 여부\n
        :param kwargs: 적재 할 데이터\n
        :return:
        """
    logger.info("client router start")
    clients = crud.get_pets(db, skip, limit)
    return clients

@router.get("/{pet_id}", response_model=List[schemas.Pet])
async def read_pet_by_id(pet_id: int, client_id: Optional[int] = 0, db: Session = Depends(db.session)):
    pets = []
    if client_id > 0 :
        pets = crud.get_pet_by_clinetid(db, client_id)
        # list item count => len(pets)
        if not pets :
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Clinet (client_id={client_id}) has no pet")
    else:
        pet = crud.get_pet(db, pet_id)
        if pet is None:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Pet not found")
        
        pets.append(pet)

    return pets


@router.post("/", status_code=status.HTTP_201_CREATED, response_model=schemas.Pet)
def create_pet(petInfo: schemas.Pet, request: Request, db: Session = Depends(db.session)):
    user = request.state.user
    petInfo.created_sign_id = user.sign_id
    petInfo.created_sign_name = user.sign_name
    petInfo.modified_sign_id = user.sign_id
    petInfo.modified_sign_name = user.sign_name
    petInfo.hospital_id = user.hospital_id

    new_pet = crud.create_pet(db, petInfo)
    if new_pet is None:
      raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Pet insert failed")

    return new_pet

@router.put("/", status_code=status.HTTP_202_ACCEPTED, response_model=schemas.Pet)
def modify_pet(petInfo: schemas.Pet, request: Request, db: Session = Depends(db.session)):
    user = request.state.user
    petInfo.modified_sign_id = user.sign_id
    petInfo.modified_sign_name = user.sign_name
    petInfo.hospital_id = user.hospital_id

    pet = crud.update_pet(db, petInfo)
    if pet is None:
      raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Pet modify failed")

    return pet

# @router.delete('/{client_id}', status_code=status.HTTP_204_NO_CONTENT)
# def delete_client(client_id: int, db: Session = Depends(db.session)):
#     return crud.delete_client(db, client_id)


