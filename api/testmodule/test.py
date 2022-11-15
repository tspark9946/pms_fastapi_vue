from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from urllib.parse import quote
#from api.database import crud

DB_URL = "mysql+pymysql://pmsuser:%s@146.56.163.50/testdb?charset=utf8mb4" % quote('starP@9214')

engine = create_engine(DB_URL, echo=True)
Base = declarative_base()
session = sessionmaker()(bind=engine)

#crud.delete_client(session(), 1)

if __name__ == '__main__':
    import sys
    from os import path
    print(path.dirname( path.dirname( path.abspath(__file__) ) ))
    sys.path.append(path.dirname( path.dirname( path.abspath(__file__) ) ))


    from database import crud
        
    crud.delete_client(session, 1)