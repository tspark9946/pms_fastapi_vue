from datetime import datetime
from typing import List
from loguru import logger
from uuid import uuid4
import string
import secrets

from fastapi import APIRouter, Depends, status, HTTPException
from fastapi.responses import Response
from fastapi.requests import Request
from sqlalchemy.orm import Session

from ..database.conn import db
from ..database.dbmodel import User, ApiKeys, ApiWhiteLists
from ..database import crud
from ..models import schemas as m
from ..errors import exceptions as ex
from ..common.consts import MAX_API_KEY, MAX_API_WHITELIST


router = APIRouter(prefix="/user", tags=["User(Sign)"])


@router.get('/apikeys', response_model=List[m.GetApiKeyList])
async def get_api_keys(request: Request):
    """
    API KEY 조회
    :param request:
    :return:
    """
    user = request.state.user
    api_keys = ApiKeys.filter(sign_id=user.sign_id).all()
    return api_keys


@router.post('/apikeys', response_model=m.GetApiKeys)
async def create_api_keys(request: Request, key_info: m.AddApiKey, session: Session = Depends(db.session)):
    """
    API KEY 생성
    :param request:
    :param key_info:
    :param session:
    :return:
    """
    user = request.state.user

    api_keys = ApiKeys.filter(session, sign_id=user.sign_id, status='active').count()
    if api_keys == MAX_API_KEY:
        raise ex.MaxKeyCountEx()

    alphabet = string.ascii_letters + string.digits
    s_key = ''.join(secrets.choice(alphabet) for _ in range(40))
    uid = None
    while not uid:
        uid_candidate = f"{str(uuid4())[:-12]}{str(uuid4())}"
        uid_check = ApiKeys.get(access_key=uid_candidate)
        if not uid_check:
            uid = uid_candidate

    key_info = key_info.dict()
    new_key = ApiKeys.create(session, auto_commit=True, secret_key=s_key, sign_id=user.sign_id, access_key=uid, **key_info)
    return new_key

@router.put('/apikeys/{key_id}', response_model=m.GetApiKeyList)
async def update_api_keys(request: Request, key_id: int, key_info: m.AddApiKey):
    """
    API KEY User Memo Update
    :param request:
    :param key_id:
    :param key_info:
    :return:
    """
    user = request.state.user
    key_data = ApiKeys.filter(apikeys_id=key_id)
    if key_data and key_data.first().sign_id == user.sign_id:
        return key_data.update(auto_commit=True, **key_info.dict())
    raise ex.NoKeyMatchEx()


@router.delete('/apikeys/{key_id}')
async def delete_api_keys(request: Request, key_id: int, access_key: str):
    user = request.state.user
    await check_api_owner(user.sign_id, key_id)
    search_by_key = ApiKeys.filter(access_key=access_key)
    if not search_by_key.first():
        raise ex.NoKeyMatchEx()
    search_by_key.delete(auto_commit=True)
    return m.MessageOk()


@router.get('/apikeys/{key_id}/whitelists', response_model=List[m.GetAPIWhiteLists])
async def get_api_keys(request: Request, key_id: int):
    user = request.state.user
    await check_api_owner(user.sign_id, key_id)
    whitelists = ApiWhiteLists.filter(apikeys_id=key_id).all()
    return whitelists


@router.post('/apikeys/{key_id}/whitelists', response_model=m.GetAPIWhiteLists)
async def create_api_keys(request: Request, key_id: int, ip: m.CreateAPIWhiteLists, session: Session = Depends(db.session)):
    user = request.state.user
    await check_api_owner(user.sign_id, key_id)
    import ipaddress
    try:
        _ip = ipaddress.ip_address(ip.ip_addr)
    except Exception as e:
        raise ex.InvalidIpEx(ip.ip_addr, e)
    if ApiWhiteLists.filter(apikeys_id=key_id).count() == MAX_API_WHITELIST:
        raise ex.MaxWLCountEx()
    ip_dup = ApiWhiteLists.get(apikeys_id=key_id, ip_addr=ip.ip_addr)
    if ip_dup:
        return ip_dup
    ip_reg = ApiWhiteLists.create(session=session, auto_commit=True, apikeys_id=key_id, ip_addr=ip.ip_addr)
    return ip_reg


@router.delete('/apikeys/{key_id}/whitelists/{list_id}')
async def delete_api_keys(request: Request, key_id: int, list_id: int):
    user = request.state.user
    await check_api_owner(user.sign_id, key_id)
    ApiWhiteLists.filter(apiwhitelists_id=list_id, apikeys_id=key_id).delete(auto_commit=True)

    return m.MessageOk()


async def check_api_owner(user_id, key_id):
    api_keys = ApiKeys.get(apikeys_id=key_id, sign_id=user_id)
    if not api_keys:
        raise ex.NoKeyMatchEx()
