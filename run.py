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