from fastapi import FastAPI
from app.api import api

app = FastAPI()

@app.get("/")
def root():
    return {"message": "api para imobiliária em python"}

@app.get("/get-all-comments")
def getComments():
    return api.get_all_comments()

@app.get("/get-comments-by-id/{id}")
def getCommentsById(id: str):
    return api.get_by_comments_id(id)

@app.get("/set-comments/{assunto}/{texto}/{email}/{resposta}/{setor}/{anonimo}")
def setComments(assunto: str, texto: str, email: str, resposta: str,setor: str,anonimo: bool):
    return api.setComments(assunto, texto, email,resposta,setor,anonimo)

@app.get("/set-comments-response/{id}/{resposta}")
def setCommentsResponse(id: str, resposta: str):
    return api.setCommentsResponse(id, resposta) 

@app.get("/set-users/{usuario}/{senha}")
def setUsers(usuario: str, senha: str):
    return api.set_users(usuario, senha)

@app.get("/login/{usuario}/{senha}")
def login(usuario: str, senha: str):
    return api.login(usuario, senha)
