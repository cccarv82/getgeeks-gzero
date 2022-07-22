*Settings*
Documentation                   Attempt to Be a Geek Test Suite

Resource                        ${EXECDIR}/resources/Base.robot

Suite Setup                      Start Session For Attempt To Be A Geek
# Test Teardown                   Finish Session
Test Template                   Attempt To Be A Geek

*Variables*
${long_desc}                    Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.   Descrição com mais de 255 caracteres.

*Test Cases*
# Desc Field
Short Desc                      desc                        Descrição curta            A descrição deve ter no minimo 80 caracteres
Long Desc                       desc                        ${long_desc}               A descrição deve ter no máximo 255 caracteres
Empty Desc                      desc                        ${EMPTY}                   Informe a descrição do seu trabalho
# Whatsapp Field
Empty Whatsapp                  whatsapp                    ${EMPTY}                   O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp Only DDD               whatsapp                    11                         O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp Only Number            whatsapp                    999999999                  O Whatsapp deve ter 11 digitos contando com o DDD
# Valor Field
Empty cost                      cost                        ${EMPTY}                   Valor hora deve ser numérico
Cost Letters                    cost                        abc                        Valor hora deve ser numérico
Cost Char                       cost                        @#$                        Valor hora deve ser numérico
Cost Alpha                      cost                        abc123                     Valor hora deve ser numérico
# Printer Repair
No Printer Repair               printer_repair              ${EMPTY}                   Por favor, informe se você é um Geek Supremo
# Work Model
No Work Model                   work                        ${EMPTY}                   Por favor, selecione o modelo de trabalho

