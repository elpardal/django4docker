# Django / PostgreSQL / Gunicorn / NGINX 

## Como usar este projeto

### Ambiente de Desenvolvimento

Usa o servidor de desenvolvimento padrão do Django.

No diretório **envs/dev/**

1. Renomeie .env-exemplo para .env

1. Atualize as variáveis ​​de ambiente nos arquivos docker-compose.yml e .env

1. Construa as imagens e execute os containers:


    ```sh
    docker compose -f docker-compose.dev.yml up -d --build
    ```

    Teste em http://localhost:8000.
    
    *A pasta "app" é montada no contêiner e as alterações no código são aplicadas automaticamente.*

---

### Ambiente de Produção

Usa Gunicorn + NGINX.

No diretório **envs/prod/**

1. Renomeie *.env-exemplo* para *.env*
2. Renomeie *.env.db-exemplo* para *.env.db*
1. Atualize as variáveis ​​de ambiente.
1. Construa as imagens e execute os containers:

    ```sh
    docker compose -f docker-compose.prod.yml up -d --build
    ```

    Teste em http://localhost:1337. 
    
    *Nenhuma pasta é montada nesse ambiente, a imagem deve ser reconstruída com o build para aplicar novas alterações.*

---

#### Poetry

Se você também usa ele como gerenciamento de pacotes do python, pode atualizar o arquivo **requirements.txt** (que é usado no container) da seguinte maneira:

 ```sh
 poetry export --without-hashes --format=requirements.txt > requirements.txt
 ```