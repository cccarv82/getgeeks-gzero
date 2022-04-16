*Settings*
Documentation                   Attempt to Be a Geek Test Suite

Resource                        ${EXECDIR}/resources/Base.robot

Test Setup                      Start Session For Attempt To Be A Geek
#Test Teardown                   Finish Session

*Variables*
${long_desc}                    Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.

*Test Cases*
Should Not Be A Geek
    [Tags]                      negative
    [Template]                  Attempt To Be A Geek

# Desc Field
    desc                        Descrição curta            A descrição deve ter no minimo 80 caracteres
    desc                        ${long_desc}               A descrição deve ter no máximo 255 caracteres
    desc                        ${EMPTY}                   Informe a descrição do seu trabalho
# Whatsapp Field
    whatsapp                    ${EMPTY}                   O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp                    11                         O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp                    999999999                  O Whatsapp deve ter 11 digitos contando com o DDD
# Valor Field
    cost                        ${EMPTY}                   Valor hora deve ser numérico
    cost                        abc                        Valor hora deve ser numérico
    cost                        @#$                        Valor hora deve ser numérico
    cost                        abc123                     Valor hora deve ser numérico
