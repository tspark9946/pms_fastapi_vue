from dataclasses import asdict
from typing import Optional

import os
import uvicorn
from fastapi import FastAPI, Depends
from fastapi.security import APIKeyHeader
from starlette.middleware.base import BaseHTTPMiddleware
from fastapi.middleware.cors import CORSMiddleware
from loguru import logger

from api.common.config import conf, PORT, BIND, WORKERS, RELOAD
from api.database.conn import db
from api.routes import index, client


def create_app():
    """
    앱 함수 실행
    :return:
    """
    c = conf()
    # test code
    print(c.DB_URL)
    # ----------------
    app = FastAPI()
    conf_dict = asdict(c)

    # logging
    LOG_DIR = c.BASE_DIR + "/logs"

    if not os.path.exists(LOG_DIR):
        os.makedirs(LOG_DIR)

    logger.add(LOG_DIR + "/server.log",
               rotation="10MB",
               colorize=True,
               format="<green>{time:YYYYMMDD_HH:mm:ss}</green> | {level} | <level>{message}</level>",
               level="ERROR"
               )

    db.init_app(app, **conf_dict)
    # 데이터 베이스 이니셜라이즈

    # 레디스 이니셜라이즈

    # 미들웨어 정의
#    app.add_middleware(middleware_class=BaseHTTPMiddleware, dispatch=access_control)
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["http://localhost:3000"],
        # allow_origins=conf().ALLOW_SITE,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
 #   app.add_middleware(TrustedHostMiddleware, allowed_hosts=conf().TRUSTED_HOSTS, except_path=["/health"])

    # 라우터 정의
    app.include_router(index.router)
    app.include_router(client.router)
#    app.include_router(auth.router, tags=["Authentication"], prefix="/api")
#    if conf().DEBUG:
#        app.include_router(services.router, tags=["Services"], prefix="/api", dependencies=[Depends(API_KEY_HEADER)])
#    else:
#        app.include_router(services.router, tags=["Services"], prefix="/api")
#    app.include_router(users.router, tags=["Users"], prefix="/api", dependencies=[Depends(API_KEY_HEADER)])

    return app


app = create_app()

if __name__ == "__main__":
    uvicorn.run(
        "api:app",
        host=BIND,
        port=int(PORT),
        reload=RELOAD,
        debug=RELOAD,
        workers=int(WORKERS),
    )

