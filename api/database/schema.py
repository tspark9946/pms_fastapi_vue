
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

# table create => base.creat_all(engine)
# table 생성이 아니라면 relationship 필드는 정의할 필요없음
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
    rank = relationship("Rank", back_populates="client")
    client_firstdate = Column(Date)
    client_debt = Column(DECIMAL(10,2))
    hospital_id = Column(Integer, ForeignKey('HOSPITAL.hospital_id'))

class Rank(Base, BaseMixin):
    __tablename__ = "rank"
    rank_id = Column(Integer, primary_key=True, index=True)
    rank_name = Column(String(length=64))
    order_idx = Column(Integer)
    client = relationship("Client", back_populates="rank")

class Hospital(Base, BaseMixin):
    __tablename__ = "HOSPITAL"
    hospital_id = Column(Integer, primary_key=True, index=True)
    hospital_name = Column(String(64))

