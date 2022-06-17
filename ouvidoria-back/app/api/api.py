from operator import truediv


def get_all_comments():
    with open('dados/comentarios.txt', 'r') as dadoscomentarios:
        comentariosdados = dadoscomentarios.readlines()
        comentarios = []
        for x in comentariosdados:
            comentario = x.split(',')
            comentario[5] = comentario[5].replace('\n', '')
            comentarios.append(comentario)
        return comentarios

def get_by_comments_id(id):
    with open('dados/comentarios.txt', 'r') as dadoscomentarios:
        comentariosdados = dadoscomentarios.readlines()
        comentarios = []
        for x in comentariosdados:
            comentario = x.split(',')
            comentario[5] = comentario[5].replace('\n', '')
            if(int(comentario[0]) == id):
                comentarios.append(comentario)
        return comentarios
    
def set_users(usuario, senha):
    with open('dados/users.txt', 'r') as dadosusers:
        usersdados = dadosusers.readlines()
        x = usersdados[len(usersdados)-1].split(',')
        id = int(x[0]) +  1
        adicionar = str(id) + ',' + usuario + ',' + senha + '\n' 
        usersdados.append(adicionar)
        mensagem = 'usuário '+ str(id) +' inserido com sucesso'
        with open('dados/users.txt', 'w') as dados:
            dados.writelines(usersdados)
        return mensagem
    
def login(usuario, senha):
    with open('dados/users.txt', 'r') as dadosusers:
        usersdados = dadosusers.readlines()
        logado = False
        for x in usersdados:
            y = x.split(',')
            y[2] = y[2].replace('\n', '')
            if(y[1] == usuario and y[2] == senha):
                logado = True
        return logado