# API Users

Ator: Aplicação Web, Mobile ou qualquer outro front

## Sessions

### Login do usuário

`Dado que o usuário submeteu o formulário de login com dados corretos`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 200`
`E deve retornar um token JWT na resposta`
`E esse token deve exirar em 10 dias`

### Senha Incorreta

`Dado que o usuário submeteu o formulário de login com senha inválida`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Usuário Não Existe

`Dado que o usuário submeteu o formulário de login com email não cadastrado`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized"`

### Email No Formato Incorreto

`Dado que o usuário submeteu o formulário de login com email no formato incorreto`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Incorrect Email"`

### Email Em Branco

`Dado que o usuário submeteu o formulário de login com email em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required Email"`

### Sem Campo Email na Requisição

`Dado que o usuário submeteu o formulário de login sem informar email`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required Email"`

### Senha Em Branco

`Dado que o usuário submeteu o formulário de login com senha em branco`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required Password"`

### Sem Campo Senha na Requisição

`Dado que o usuário submeteu o formulário de login sem informar senha`
`Quando faço uma requisição POST para a rota /sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Required Password"`