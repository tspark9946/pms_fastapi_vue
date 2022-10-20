from multiprocessing.connection import Client
from sqlalchemy.orm import Session
from sqlalchemy import delete
from fastapi import HTTPException, status
from . import dbmodel
from ..models import schemas
from ..utils.hashing import Hash

# user crud
def create_user(db: Session, hospital_id:int, request: schemas.User):

    hospital = dbmodel.Hospital.get(hospital_id=hospital_id)
    if not hospital:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Hospital not exists")

    hashedPassword = Hash.bcrypt(request.sign_password)
    new_user = dbmodel.User.create \
        (db, auto_commit=True, sign_name=request.sign_name, sign_password=hashedPassword, sign_email=request.sign_email, sign_cellphone=request.sign_cellphone, \
            sign_license_number=request.sign_license_number, sign_department=request.sign_department, sign_jobtitle=request.sign_jobtitle, hospital_id=hospital_id)
    if new_user is None:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="User insert failed")

    return new_user


# Client crud
def get_clients(db: Session, skip: int = 0, limit: int = 100):
    return db.query(dbmodel.Client).offset(skip).limit(limit).all()

def get_client(db: Session, client_id: int):
    return db.query(dbmodel.Client).filter(dbmodel.Client.client_id==client_id).first()
    
def create_client(db: Session, request: schemas.Client):
    # new_client = dbmodel.Client(**request.dict())
    try: 
        new_client = dbmodel.Client(client_serial=request.client_serial, client_name=request.client_name, client_zip=request.client_zip, client_address1=request.client_address1, \
            client_address2=request.client_address2, client_email=request.client_email, client_etc=request.client_etc, client_alert=request.client_alert, rank_id=request.rank_id, \
            client_memo1=request.client_memo1, client_memo1_encoded=request.client_memo1_encoded, client_memo2=request.client_memo2, client_memo2_encoded=request.client_memo2_encoded, \
            created_sign_id=request.created_sign_id, created_sign_name=request.created_sign_name, modified_sign_id=request.modified_sign_id, modified_sign_name=request.modified_sign_name, \
            hospital_id=request.hospital_id)

        for tel in request.tellist:
            new_tel = dbmodel.Tel(tel_number=tel.tel_number, tel_name=tel.tel_name, tel_default=tel.tel_default, tel_type=tel.tel_type, \
                tel_allow_phone=tel.tel_allow_phone, tel_allow_sms=tel.tel_allow_sms, tel_allow_email=tel.tel_allow_email, created_sign_id=new_client.created_sign_id, \
                created_sign_name=new_client.created_sign_name, hospital_id=new_client.hospital_id, client=new_client)
            db.add(new_tel)

        db.add(new_client)
        db.commit()
    except:
        db.rollback()

    return new_client


def update_client(db: Session, request: schemas.Client):
    client = dbmodel.Client.get(db, client_id=request.client_id)
    if not client:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Client with id {request.client_id} not found")
    try:        
        client.client_serial=request.client_serial
        client.client_name=request.client_name
        client.client_zip=request.client_zip
        client.client_address1=request.client_address1
        client.client_address2=request.client_address2
        client.client_email=request.client_email
        client.client_etc=request.client_etc
        client.client_alert=request.client_alert
        client.rank_id=request.rank_id
        client.client_debt=request.client_debt
        client.client_resmoney=request.client_resmoney
        client.client_point=request.client_point
        client.client_memo1=request.client_memo1
        client.client_memo1_encoded=request.client_memo1_encoded
        client.client_memo2=request.client_memo2
        client.client_memo2_encoded=request.client_memo2_encoded
        client.modified_sign_id=request.modified_sign_id
        client.modified_sign_name=request.modified_sign_name

        for tel in request.tellist:
            if (tel.editMode == schemas.EditMode.Delete):
                dbmodel.Tel.filter(db, tel_id=tel.tel_id).delete()
            elif (tel.editMode == schemas.EditMode.Update):
                editTel = dbmodel.Tel.get(db, tel_id=tel.tel_id)
                if editTel:
                    editTel.tel_number=tel.tel_number
                    editTel.tel_name=tel.tel_name
                    editTel.tel_default=tel.tel_default
                    editTel.tel_type=tel.tel_type
                    editTel.tel_allow_phone=tel.tel_allow_phone
                    editTel.tel_allow_sms=tel.tel_allow_sms
                    editTel.tel_allow_email=tel.tel_allow_email
                    editTel.modified_sign_id=client.modified_sign_id
                    editTel.modified_sign_name=client.modified_sign_name
            else:
                new_tel = dbmodel.Tel(tel_number=tel.tel_number, tel_name=tel.tel_name, tel_default=tel.tel_default, tel_type=tel.tel_type, \
                    tel_allow_phone=tel.tel_allow_phone, tel_allow_sms=tel.tel_allow_sms, tel_allow_email=tel.tel_allow_email, created_sign_id=client.created_sign_id, \
                    created_sign_name=client.created_sign_name, hospital_id=client.hospital_id, client=client)
                db.add(new_tel)

        db.commit()
    except:
        db.rollback()

    return client


def delete_client(db: Session, client_id: int):
    client = dbmodel.Client.get(client_id=client_id)
    if not client:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Client with id {client_id} not found")
    dbmodel.Client.filter(db, client_id=client_id).delete()
    db.commit
    return 'Done'

def delete_client2(db: Session, client_id: int):
    stmt = delete(dbmodel.Client).where(dbmodel.Client.client_id == client_id)
    print(stmt)

