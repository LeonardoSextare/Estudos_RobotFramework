def verificar_numero_impar_par(numero: float):
    if numero%2 == 0:
        print(f'O número {numero} é Par!')
        return 'Par'

    print(f'O número {numero} é Impar!')
    return 'Impar'

def contar_caracteres(palavra: str):
    print(f'A palavra "{palavra}" possui {len(palavra)}')
    return len(palavra)