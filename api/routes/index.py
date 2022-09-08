from datetime import datetime
from typing import Optional
from unicodedata import name

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from inspect import currentframe as frame

from sqlalchemy.orm import Session
from ..database.conn import db
from ..models import schemas

router = APIRouter()


@router.get("/")
def index():
    """
    ELB 상태 체크용 API
    :return:
    """
    
    
    current_time = datetime.utcnow()
    return Response(f"Notification API (UTC: {current_time.strftime('%Y.%m.%d %H:%M:%S')})")

# /blog?limit=50&published=true
@router.get('/blog')
def start(limit: int = 10, published: bool = True, sort: Optional[str] = None):
    if published:
        return {'data': f'{limit} published blogs from db'}
    else:
        return {'data': f'{limit} unpublished blogs from db'}


@router.get('/blog/{id}')
def start(id: int):
    return {'data': f'{id} blogs from db'}

#request model 사용예제
@router.post('/blog')
def create_blog(request: schemas.Blog):
    return {'data': f'blog created {request.title}'}
