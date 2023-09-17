*** Variables ***
@{NUMEROS}              1    3    5    7    9    10    18    19
@{NUMEROS_VALIDOS}      5    10


*** Test Cases ***
Mostrando os números validos da lista
    Percorrer uma lista printando valores validos    ${NUMEROS}    ${NUMEROS_VALIDOS}


*** Keywords ***
Percorrer uma lista printando valores validos
    [Arguments]    ${LISTA}    ${VALORES_VALIDOS}
    FOR   ${INDICE}    ${ELEMENTO}    IN ENUMERATE   @{LISTA}
        IF    $ELEMENTO in @{VALORES_VALIDOS}
            Log To Console    Eu sou o número ${ELEMENTO}!
        ELSE
            Log To Console    Eu não sou o número ${NUMEROS_VALIDOS[0]} e nem o ${NUMEROS_VALIDOS[1]}
        END
    END
    
