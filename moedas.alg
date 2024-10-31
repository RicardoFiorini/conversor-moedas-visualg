algoritmo "Conversor de Moeda"
variáveis
    valorReais, valorDolares, valorEuros : real
    taxaDolar, taxaEuro : real
início
    // Definindo as taxas de conversão
    taxaDolar ← 5.20    // Exemplo: 1 dólar = 5.20 reais
    taxaEuro ← 5.70     // Exemplo: 1 euro = 5.70 reais

    escreva("Digite o valor em reais: ")
    leia(valorReais)

    // Convertendo para dólares e euros
    valorDolares ← valorReais / taxaDolar
    valorEuros ← valorReais / taxaEuro

    // Exibindo os resultados
    escreva("Valor em dólares: ", valorDolares:0:2)
    escreva("\nValor em euros: ", valorEuros:0:2)
fimenquanto
