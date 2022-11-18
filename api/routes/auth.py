from datetime import datetime, timedelta
from loguru import logger
import jwt
from fastapi import APIRouter, Depends, status, HTTPException
from fastapi.responses import Response
from sqlalchemy.orm import Session

from ..database import crud
from ..database.conn import db
from ..database.dbmodel import User
from ..models import schemas
from ..common.consts import JWT_ALGORITHM, JWT_SECRET, ACCESS_TOKEN_EXPIRE_MINUTES
from ..utils.token import create_access_token
from ..utils.hashing import Hash

router = APIRouter(prefix="/auth", tags=["Authentication"])

@router.post("/register/{hospital_id}", status_code=status.HTTP_201_CREATED, response_model=schemas.Token)
async def create_user(id:int, request: schemas.User, db: Session = Depends(db.session)):
  logger.info("register router start")

  is_exist = await is_email_exist(request.sign_email)
  if is_exist:
    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST , detail="Invalid Credentials(EMAIL_EXISTS)")

  new_user = crud.create_user(db, id, request)
  token = dict(Authorization=f"Bearer {create_access_token(data=schemas.UserToken.from_orm(new_user).dict(exclude={'sign_password'}))}")
  return token


@router.post('/login', status_code=status.HTTP_200_OK, response_model=schemas.Token)
async def login(request: schemas.Login):
  if not request.sign_email or not request.sign_password:
    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST , detail="Email and PW must be provided")

  user = User.get(sign_email=request.sign_email)
  if not user:
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Invalid Credentials(NO_MATCH_USER)")
  if not Hash.verify(request.sign_password, user.sign_password):
    raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=f"Incorrect password")
  status.HTTP_422_UNPROCESSABLE_ENTITY

  token = dict(Authorization=f"Bearer {create_access_token(data=schemas.UserToken.from_orm(user).dict(exclude={'sign_password'}))}")
  return token
  

async def is_email_exist(email: str):
  get_email = User.get(sign_email=email)
  if get_email:
    return True
  return False

