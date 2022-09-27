
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

from api.database.conn import Base
from api.database.sqlbase import BaseMixin

# table create => Base.metadata.create_all(bind=engine)

# backref vs back_populates
# backref : 테이블 한쪽에만 명시하면 됨. 자동으로 다른 테이블 내용을 채워주지않음
# back_populate : 관계를 맺는 양쪽테이블에 다 명시해야 함. 자동으로 다른 테이블 내용을 채워줌


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
    client_alert = Column(Integer)
    rank_id = Column(Integer, ForeignKey('rank.rank_id'))
    rank = relationship("Rank", back_populates="client")
    client_firstdate = Column(Date)
    client_debt = Column(DECIMAL(10, 2))
    client_resmoney = Column(DECIMAL(10, 2))
    client_point = Column(DECIMAL(10, 2))
    client_memo1 = Column(String)
    client_memo1_encoded = Column(String)
    client_memo2 = Column(String)
    client_memo2_encoded = Column(String)
    client_state = Column(Integer)
    created_sign_id = Column(Integer)
    created_sign_name = Column(String)
    modified_sign_id = Column(Integer)
    modified_sign_name = Column(String)
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))
    tellist = relationship("Tel", back_populates="client")


class Rank(Base):
    __tablename__ = "rank"
    rank_id = Column(Integer, primary_key=True, index=True)
    rank_name = Column(String(length=64))
    order_idx = Column(Integer)
    client = relationship("Client", back_populates="rank")


class Tel(Base, BaseMixin):
    __tablename__ = "tel"
    tel_id = Column(Integer, primary_key=True, index=True)
    client_id = Column(Integer, ForeignKey('client.client_id'))
    client = relationship("Client", back_populates="tellist")
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


