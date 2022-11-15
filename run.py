import uvicorn
from api.common.config import conf, PORT, BIND, WORKERS, RELOAD

if __name__ == "__main__":
    uvicorn.run(
        "api:app",
        host=BIND,
        port=int(PORT),
        reload=RELOAD,
        debug=RELOAD,
        workers=int(WORKERS),
    )
    
    # test code 
    # from sqlalchemy import create_engine
    # from sqlalchemy.ext.declarative import declarative_base
    # from sqlalchemy.orm import sessionmaker
    # from urllib.parse import quote
    # from api.database import crud

    # DB_URL = "mysql+pymysql://pmsuser:%s@146.56.163.50/testdb?charset=utf8mb4" % quote('starP@9214')

    # engine = create_engine(DB_URL, echo=True)
    # Base = declarative_base()
    # session = sessionmaker(bind=engine)

    # crud.delete_client(session(), 17)

