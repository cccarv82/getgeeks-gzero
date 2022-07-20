# API Users

Ator: Aplicação Web, Mobile ou outro Front

## Sessions

### Login do Usuário

`Dado que o usuário submeteu o formulário de login com dados corretos`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 200`
`E deve retornar um token JWT no response`
`E esse token deve expirar em 10 dias`

### Senha Incorreta

`Dado que o usuário submeteu o formulário de login com senha inválida`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Usuário não existe

`Dado que o usuário submeteu o formulário de login com email não cadastrado`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Email no formato incorreto

`Dado que o usuário submeteu o formulário de login com email no formato incorreto`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Incorrect email"`

### Email em branco

`Dado que o usuário submeteu o formulário de login com email em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required email"`

### Sem o campo email

`Dado que o usuário submeteu o formulário de login sem o email`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required email"`

### Senha em branco

`Dado que o usuário submeteu o formulário de login com senha em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required pass"`

### Sem o campo senha

`Dado que o usuário submeteu o formulário de login sem a senha`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required pass"`