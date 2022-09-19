from statistics import mode
from sqlalchemy.orm import Session
from . import dbmodel
from ..models import schemas


def get_clients(db: Session, skip: int = 0, limit: int = 100):
    return db.query(dbmodel.Client).offset(skip).limit(limit).all()

    # return db.query(dbmodel.Client, dbmodel.Tel).\
    #     filter(dbmodel.Client.client_id==dbmodel.Tel.client_id).\
    #     offset(skip).limit(limit).all()


def get_client(client_id: int):
    return dbmodel.Client.get(client_id=client_id)
