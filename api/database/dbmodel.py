
from email.policy import default
from sqlalchemy import (
    Column,
    Integer,
    String,
    Date,
    DateTime,
    DECIMAL,
    func,
    Enum,
    Boolean,
    TIMESTAMP,
    ForeignKey,
)
from sqlalchemy.orm import relationship

from .conn import Base
from .sqlbase import BaseMixin

# table create => Base.metadata.create_all(bind=engine)

# backref vs back_populates
# backref : 테이블 한쪽에만 명시하면 됨. 자동으로 관계된 테이블 내용을 채워주지않음
# back_populate : 관계를 맺는 양쪽테이블에 다 명시해야 함. 자동으로 관계된 테이블 내용을 채워줌


class Hospital(Base, BaseMixin):
    __tablename__ = "HOSPITAL"
    hospital_id = Column(Integer, primary_key=True, index=True)
    hospital_name = Column(String(64))
    hospital_master = Column(String(64))
    hospital_tel1 = Column(String(64))
    hospital_address1 = Column(String(127))
    hospital_address2 = Column(String(127))


class User(Base, BaseMixin):
    __tablename__ = "sign"
    sign_id = Column(Integer, primary_key=True, index=True)
    sign_name = Column(String(32))
    sign_email = Column(String(64))
    sign_password = Column(String(255))
    sign_cellphone = Column(String(50))
    sign_license_number = Column(String)
    sign_department = Column(String)
    sign_jobtitle = Column(String)
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))
    hospital = relationship("Hospital", backref="sign")
    keys = relationship("ApiKeys", back_populates="users")

class ApiKeys(Base, BaseMixin):
    __tablename__ = "apikeys"
    apikeys_id = Column(Integer, primary_key=True, index=True)
    access_key = Column(String(length=64), nullable=False, index=True)
    secret_key = Column(String(length=64), nullable=False)
    user_memo = Column(String(length=40), nullable=True)
    status = Column(Enum("active", "stopped", "deleted"), default="active")
    is_whitelisted = Column(Boolean, default=False)
    sign_id = Column(Integer, ForeignKey("sign.sign_id"), nullable=False)
    whitelist = relationship("ApiWhiteLists", backref="apikeys")
    users = relationship("User", back_populates="keys")


class ApiWhiteLists(Base, BaseMixin):
    __tablename__ = "apiwhitelists"
    apiwhitelists_id = Column(Integer, primary_key=True, index=True)
    ip_addr = Column(String(length=64), nullable=False)
    apikeys_id = Column(Integer, ForeignKey("apikeys.apikeys_id"), nullable=False)


class Client(Base, BaseMixin):
    __tablename__ = "client"
    client_id = Column(Integer, primary_key=True, index=True)
    client_serial = Column(Integer, nullable=False, index=True)
    client_name = Column(String(64), nullable=True)
    client_zip = Column(String(10), nullable=True)
    client_address1 = Column(String(127), nullable=True)
    client_address2 = Column(String(127), nullable=True)
    client_email = Column(String(64), nullable=True)
    client_etc = Column(String(127), nullable=True)
    client_alert = Column(Integer, default=0)
    rank_id = Column(Integer, ForeignKey('rank.rank_id'))
    rank = relationship("Rank", backref="client")
    client_firstdate = Column(Date, default=func.now())
    client_debt = Column(DECIMAL(10, 2), default=0.0)
    client_resmoney = Column(DECIMAL(10, 2), default=0.0)
    client_point = Column(DECIMAL(10, 2), default=0.0)
    client_memo1 = Column(String)
    client_memo1_encoded = Column(String)
    client_memo2 = Column(String)
    client_memo2_encoded = Column(String)
    client_state = Column(Integer, default=0)
    created_sign_id = Column(Integer)
    created_sign_name = Column(String)
    modified_sign_id = Column(Integer)
    modified_sign_name = Column(String)
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))
    tellist = relationship("Tel", backref="client")
    pets = relationship("Pet", back_populates="client")


class Rank(Base):
    __tablename__ = "rank"
    rank_id = Column(Integer, primary_key=True, index=True)
    rank_name = Column(String(length=64))
    order_idx = Column(Integer)


class Tel(Base, BaseMixin):
    __tablename__ = "tel"
    tel_id = Column(Integer, primary_key=True, index=True)
    client_id = Column(Integer, ForeignKey('client.client_id'))
    tel_number = Column(String(length=32))
    tel_name = Column(String(length=64))
    tel_default = Column(Integer)
    tel_type = Column(Integer)
    tel_allow_phone = Column(Integer)
    tel_allow_sms = Column(Integer)
    tel_allow_email = Column(Integer)
    created_sign_id = Column(Integer)
    created_sign_name = Column(String)
    modified_sign_id = Column(Integer)
    modified_sign_name = Column(String)
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))

    
# Pet 
class Species(Base):
    __tablename__ = "SPECIES"
    species_id = Column(Integer, primary_key=True, index=True)
    species_identifier = Column(String)
    species_name = Column(String)

class Breed(Base):
    __tablename__ = "BREED"
    breed_id = Column(Integer, primary_key=True, index=True)
    breed_name = Column(String)
    breed_engname = Column(String)
    species_id = Column(Integer, ForeignKey('SPECIES.species_id'))

class Sex(Base):
    __tablename__ = "SEX"
    sex_id = Column(Integer, primary_key=True, index=True)
    sex_identifier = Column(String)
    sex_name = Column(String)

class Taxfreetype(Base):
    __tablename__ = "TAXFREETYPE"
    taxfreetype_id = Column(Integer, primary_key=True, index=True)
    taxfreetype_name = Column(String)
    #pet = relationship("Pet", back_populates="taxfreetype")

class Pet(Base, BaseMixin):
    __tablename__ = "pet"
    pet_id = Column(Integer, primary_key=True, index=True)
    client_id = Column(Integer, ForeignKey('client.client_id'))
    client = relationship("Client", back_populates="pets")
    pet_serial = Column(Integer, nullable=False, index=True)
    pet_rfid = Column(String, nullable=True)
    pet_rfidtype = Column(Integer, default=0)
    pet_name = Column(String, default="")
    species_id = Column(Integer, ForeignKey('SPECIES.species_id'))
    species = relationship("Species", backref="pet")
    pet_breed = Column(String, nullable=True)
    sex_id = Column(Integer, ForeignKey('SEX.sex_id'), nullable=True)
    sex = relationship("Sex", backref="pet")
    pet_color = Column(String, nullable=True)
    pet_birth = Column(Date, nullable=True)
    pet_staff1 = Column(String, nullable=True)
    pet_staff2 = Column(String, nullable=True)
    pet_refer = Column(String, nullable=True)
    pet_firstdate = Column(Date, nullable=False, default=func.now())
    pet_lastdate = Column(Date, nullable=False, default=func.now())
    pet_memo1 = Column(String, nullable=True)
    pet_memo1_encoded = Column(String, nullable=True)
    pet_memo2 = Column(String, nullable=True)
    pet_memo2_encoded = Column(String, nullable=True)
    pet_state = Column(Integer, default=0)
    pet_alert = Column(Integer, default=0)
    pet_feed = Column(String, nullable=True)
    taxfreetype_id = Column(Integer, ForeignKey('TAXFREETYPE.taxfreetype_id'), nullable=True)
    taxfreetype = relationship("Taxfreetype", backref="pet")
    pet_default = Column(Integer, default=0)
    created_sign_id = Column(Integer, nullable=True)
    created_sign_name = Column(String, nullable=True)
    modified_sign_id = Column(Integer, nullable=True)
    modified_sign_name = Column(String, nullable=True)
    order_idx = Column(Integer, nullable=True)
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))
