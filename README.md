# 💸 Conversor de Moedas Universal em Portugol

Este projeto é um conversor de moedas robusto e flexível (Real, Dólar e Euro) escrito em Portugol.

Ao contrário de um script simples que converte apenas em uma direção (ex: BRL -> USD), este algoritmo permite a conversão em **qualquer direção** (ex: USD -> EUR, EUR -> BRL, BRL -> USD, etc.), utilizando uma lógica de programação eficiente chamada **normalização**.

## ✨ Funcionalidades

* **Cotações Dinâmicas:** O programa não usa valores fixos. Ele solicita ao usuário as cotações atuais do Dólar e do Euro antes de realizar qualquer cálculo.
* **Conversão Universal:** Permite ao usuário escolher uma moeda de **origem** e uma moeda de **destino**, realizando a conversão em qualquer sentido entre BRL, USD e EUR.
* **Validação de Entrada:** Utiliza uma função `lerValorPositivo` para garantir que o usuário não insira valores inválidos (como `0` ou `-50`) para as cotações ou valores a serem convertidos.
* **Loop de Execução:** Permite realizar múltiplas conversões sem reiniciar o programa.
* **Código Modularizado:** O código é dividido em funções e procedimentos (`obterSimboloMoeda`, `lerValorPositivo`, `realizarConversao`), tornando o bloco principal limpo e o código geral fácil de manter.

## ⚙️ A Lógica de Normalização

Para evitar a criação de 9 estruturas `se/senao` (uma para cada par de moedas, ex: BRL->USD, BRL->EUR, USD->BRL, etc.), usamos uma abordagem de duas etapas:

1.  **Normalizar para BRL:** Qualquer que seja a moeda de entrada (USD ou EUR), o valor é **primeiro** convertido para seu equivalente em Reais (BRL), usando as cotações fornecidas.
2.  **Converter para a Saída:** O valor (agora em BRL) é **então** convertido para a moeda de saída desejada (USD ou EUR).

**Exemplo de Fluxo (USD para EUR):**
1.  Usuário quer converter 100 USD para EUR.
2.  Cotações: 1 USD = 5.20 BRL, 1 EUR = 5.70 BRL.
3.  **Etapa 1 (Normalização):** 100 USD * 5.20 = 520.00 BRL.
4.  **Etapa 2 (Conversão):** 520.00 BRL / 5.70 = 91.23 EUR.
5.  **Resultado:** 100.00 USD = 91.23 EUR.

Essa arquitetura torna o código mais limpo e facilmente escalável. Se quiséssemos adicionar o Iene (JPY), precisaríamos apenas adicionar uma opção ao menu e a sua taxa de conversão para BRL.

## 🚀 Como Executar

1.  **Ambiente:** Utilize um interpretador de Portugol como o [VisualG](httpsa://visualg3.com.br/) ou o [Portugol Studio](https://portugol-studio.github.io/).
2.  **Download:** Copie o código do arquivo.
3.  **Executar:** Abra o arquivo no interpretador e inicie a execução (normalmente com `F9`).
