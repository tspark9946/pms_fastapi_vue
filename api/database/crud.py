from statistics import mode
from sqlalchemy.orm import Session
from . import dbmodel
from ..models import schemas
from ..utils.hashing import Hash


def get_clients(db: Session, skip: int = 0, limit: int = 100):
    return db.query(dbmodel.Client).offset(skip).limit(limit).all()


def get_client(db: Session, client_id: int):
    return db.query(dbmodel.Client).filter(dbmodel.Client.client_id==client_id).first()
    # return dbmodel.Client.get(client_id=client_id)
    
def create_user(db: Session, request: schemas.User):
    hashedPassword = Hash.bcrypt(request.password)
    new_user = dbmodel.User.create(db, auto_commit=True, sign_name=request.name, sign_password=hashedPassword, sign_email=request.email, hospital_id=1)
    return new_user
