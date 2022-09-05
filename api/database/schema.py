
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
    ForeignKey,
)
from sqlalchemy.orm import relationship

from api.database.conn import Base
from api.database.schemabase import BaseMixin

class Client(Base, BaseMixin):
    __tablename__ = "client"
    client_id = Column(Integer, primary_key=True, index=True)
    client_serial =Column(Integer, nullable=False, index=True)
    client_name = Column(String(64), nullable=True) 
    client_zip = Column(String(10), nullable=True)
    client_address1 = Column(String(127), nullable=True)
    client_address2 = Column(String(127), nullable=True)
    client_alert = Column(Integer)
    rank_id = Column(Integer, ForeignKey('rank.rank_id'))
    rank = relationship("rank", back_populates="client")
    client_firstdate = Column(Date)
    client_debt = Column(DECIMAL(10,2))

class Rank(Base, BaseMixin):
    __tablename__ = "rank"
    rank_id = Column(Integer, primary_key=True, index=True)
    rank_name = Column(String(length=64))
    order_idx = Column(Integer)

# class Users(Base, BaseMixin):
#     __tablename__ = "users"
#     status = Column(Enum("active", "deleted", "blocked"), default="active")
#     email = Column(String(length=255), nullable=True)
#     pw = Column(String(length=2000), nullable=True)
#     name = Column(String(length=255), nullable=True)
#     phone_number = Column(String(length=20), nullable=True, unique=True)
#     profile_img = Column(String(length=1000), nullable=True)
#     sns_type = Column(Enum("FB", "G", "K"), nullable=True)
#     marketing_agree = Column(Boolean, nullable=True, default=True)
#     keys = relationship("ApiKeys", back_populates="users")


# class ApiKeys(Base, BaseMixin):
#     __tablename__ = "api_keys"
#     access_key = Column(String(length=64), nullable=False, index=True)
#     secret_key = Column(String(length=64), nullable=False)
#     user_memo = Column(String(length=40), nullable=True)
#     status = Column(Enum("active", "stopped", "deleted"), default="active")
#     is_whitelisted = Column(Boolean, default=False)
#     user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
#     whitelist = relationship("ApiWhiteLists", backref="api_keys")
#     users = relationship("Users", back_populates="keys")


# class ApiWhiteLists(Base, BaseMixin):
#     __tablename__ = "api_whitelists"
#     ip_addr = Column(String(length=64), nullable=False)
#     api_key_id = Column(Integer, ForeignKey("api_keys.id"), nullable=False)
