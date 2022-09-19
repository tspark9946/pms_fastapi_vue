from dataclasses import dataclass
from os import path, environ
from typing import List
from dotenv import load_dotenv
from urllib.parse import quote


""" 
시작시 매개변수 받아서 결정하는 방법 
ex) pipenv run python run.py dev

from os 
from os.path import join, dirname

BASEDIR = os.getcwd()

if len(sys.argv) < 2:
    print("no env provided from Pipfile")
    sys.exit(1)

dotenv_path = join(dirname(__file__), f".env.{sys.argv[1]}")
load_dotenv(dotenv_path)
"""
base_dir = path.dirname(path.dirname(path.dirname(path.abspath(__file__))))

load_dotenv()
PORT = environ.get("PORT")
WORKERS = environ.get("WORKERS")
RELOAD = environ.get("RELOAD")
ORIGINS = environ.get("ORIGINS")
#DB_URL = environ.get("DB_URL", "mysql+pymysql://pmsuser:%s@146.56.163.50/testdb?charset=utf8mb4" % quote('starP@9214'))
DB_URL = environ.get("DB_URL")
LOGDIR = "logs"
LOGFILE = "moviestar.log"
BIND = "0.0.0.0"

# origins="https://site1, http://site2, http://site3"
origins = []
for o in ORIGINS.split(","):
    origins.append(o)


@dataclass
class Config:
    """
    기본 Configuration
    """
    BASE_DIR: str = base_dir
    DB_POOL_RECYCLE: int = 900
    DB_ECHO: bool = True
    DEBUG: bool = False
    TEST_MODE: bool = False
    DB_URL: str = environ.get(
        "DB_URL", "mysql+pymysql://pmsuser:%s@146.56.163.50/testdb?charset=utf8mb4" % quote('starP@9214'))


@dataclass
class LocalConfig(Config):
    DB_URL: str = environ.get("DB_URL") % quote(environ.get("DB_PWD"))
    TRUSTED_HOSTS = ["*"]
    ALLOW_SITE = origins
    DEBUG: bool = True


@dataclass
class ProdConfig(Config):
    TRUSTED_HOSTS = ["*"]
    ALLOW_SITE = origins


@dataclass
class TestConfig(Config):
    DB_URL: str = "mysql+pymysql://test@localhost/notification_test?charset=utf8mb4"
    TRUSTED_HOSTS = ["*"]
    ALLOW_SITE = origins
    TEST_MODE: bool = True


def conf():
    """
    환경 불러오기
    :return:
    """
    config = dict(prod=ProdConfig, local=LocalConfig, test=TestConfig)
    return config[environ.get("API_ENV", "local")]()
