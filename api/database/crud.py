from statistics import mode
from sqlalchemy.orm import Session
from . import models
from ..models import schemas

def get_clients(db: Session, skip: int = 0, limit: int = 100):
  return db.query(models.Client).offset(skip).limit(limit).all()
  

def get_client(client_id: int):
  return models.Client.get(client_id=client_id)

  