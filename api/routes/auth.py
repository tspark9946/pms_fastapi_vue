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

@router.post("/register", status_code=status.HTTP_201_CREATED)
def create_user(request: schemas.User, db: Session = Depends(db.session)):
  logger.info("register router start")
  new_user = crud.create_user(db, request)
  if new_user is None:
      raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="User insert failed")

  # token = dict(Authorization=f"Bearer {create_access_token(data=schemas.UserToken.from_orm(new_user).dict(exclude={'sign_password'}))}")
  # return token

  access_token = create_access_token(data=schemas.UserToken.from_orm(new_user).dict(exclude={'sign_password'}))
  return {"access_token": access_token, "token_type": "bearer"}


@router.post('/login', status_code=status.HTTP_200_OK)
async def login(request: schemas.Login):
  if not request.email or not request.password:
    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST , detail="Email and PW must be provided")

  is_exist = await is_email_exist(request.email)
  if not is_exist:
    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST , detail="EMAIL_EXISTS")

  user = User.get(sign_email=request.email)
  if not user:
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Invalid Credentials")
  if not Hash.verify(request.password, user.sign_password):
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Incorrect password")

  access_token = create_access_token(data=schemas.UserToken.from_orm(user).dict(exclude={'sign_password'}))
  return {"access_token": access_token, "token_type": "bearer"}


async def is_email_exist(email: str):
  get_email = User.get(sign_email=email)
  if get_email:
    return True
  return False


# def create_access_token(*, data: dict = None, expires_delta: int = None):
#     to_encode = data.copy()
#     if expires_delta:
#         to_encode.update({"exp": datetime.utcnow() + timedelta(hours=expires_delta)})
#     encoded_jwt = jwt.encode(to_encode, JWT_SECRET, algorithm=JWT_ALGORITHM)
#     return encoded_jwt
