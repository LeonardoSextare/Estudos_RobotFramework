*** Variables ***
&{MESES}
...    Janeiro=31
...    Fevereiro=28
...    Março=31    
...    Abril=30
...    Maio=31
...    Junho=30    
...    Julho=31
...    Agosto=31
...    Setembro=30
...    Outubro=31
...    Novembro=30
...    Dezembro=31

*** Test Cases ***

Mostrar na tela os dias de cada mês
    Log To Console    Janeiro: ${MESES.Janeiro}
    Log To Console    Fevereiro : ${MESES.Fevereiro}
    Log To Console    Março : ${MESES.Março}
    Log To Console    Abril: ${MESES.Abril}
    Log To Console    Maio: ${MESES.Maio}
    Log To Console    Junho: ${MESES.Junho}
    Log To Console    Julho: ${MESES.Julho}
    Log To Console    Agosto: ${MESES.Agosto}
    Log To Console    Setembro: ${MESES.Setembro}
    Log To Console    Outubro: ${MESES.Outubro}
    Log To Console    Novembro: ${MESES.Novembro}
    Log To Console    Dezembro: ${MESES.Dezembro}