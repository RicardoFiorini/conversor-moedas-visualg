algoritmo "Conversor_de_Moeda_Universal"
// Autor: Ricardo Fiorini Cuato
// Data: 12/11/2025
// Descrição: Conversor de moedas (BRL, USD, EUR) em qualquer
//            direção, usando a lógica de normalização para BRL.

var
   continuar: caractere

//-------------------------------------------------------------
// FUNÇÃO: obterSimboloMoeda
// Objetivo: Retorna o símbolo de 3 letras da moeda.
//-------------------------------------------------------------
funcao obterSimboloMoeda(unidade: inteiro): caractere
inicio
   escolha unidade
      caso 1: retorne "BRL"
      caso 2: retorne "USD"
      caso 3: retorne "EUR"
   fimescolha
fimfuncao

//-------------------------------------------------------------
// FUNÇÃO: lerValorPositivo
// Objetivo: Lê um valor do usuário e garante que é > 0.
//-------------------------------------------------------------
funcao lerValorPositivo(mensagem: caractere): real
var
   valor: real
inicio
   repita
      escreva(mensagem)
      leia(valor)
      se (valor <= 0) entao
         escreval("Valor inválido. Deve ser um número positivo.")
      fimse
   ate (valor > 0)
   retorne valor
fimfuncao

//-------------------------------------------------------------
// PROCEDIMENTO: exibirMenuMoedas
// Objetivo: Evita repetir o mesmo menu duas vezes.
//-------------------------------------------------------------
procedimento exibirMenuMoedas()
inicio
   escreval("1 - Real (BRL)")
   escreval("2 - Dólar (USD)")
   escreval("3 - Euro (EUR)")
fimprocedimento

//-------------------------------------------------------------
// PROCEDIMENTO: realizarConversao
// Objetivo: Executa uma conversão completa.
//-------------------------------------------------------------
procedimento realizarConversao()
var
   taxaDolar, taxaEuro: real
   unidadeEntrada, unidadeSaida: inteiro
   valorEntrada, valorSaida, valorEmBRL: real

   // --- ETAPA 1: Definir as Cotações ---
   escreval("--- Configuração das Cotações ---")
   escreval("Use ponto (.) para casas decimais (ex: 5.20)")
   taxaDolar := lerValorPositivo("Digite a cotação do Dólar (1 USD para BRL): ")
   taxaEuro := lerValorPositivo("Digite a cotação do Euro (1 EUR para BRL): ")

   // --- ETAPA 2: Definir a Entrada ---
   limpatela()
   escreval("De qual moeda você quer converter?")
   exibirMenuMoedas()
   leia(unidadeEntrada) // (Validação de 1-3 pode ser adicionada)
   
   valorEntrada := lerValorPositivo("Digite o valor a ser convertido: ")

   // --- ETAPA 3: Definir a Saída ---
   escreval
   escreval("Para qual moeda você quer converter?")
   exibirMenuMoedas()
   leia(unidadeSaida) // (Validação de 1-3 pode ser adicionada)

   // --- ETAPA 4: Normalização (Converter tudo para BRL) ---
   escolha unidadeEntrada
      caso 1: // Entrada é BRL
         valorEmBRL := valorEntrada
      
      caso 2: // Entrada é USD
         valorEmBRL := valorEntrada * taxaDolar
         
      caso 3: // Entrada é EUR
         valorEmBRL := valorEntrada * taxaEuro
   fimescolha

   // --- ETAPA 5: Conversão (Converter de BRL para a saída) ---
   escolha unidadeSaida
      caso 1: // Saída é BRL
         valorSaida := valorEmBRL
      
      caso 2: // Saída é USD
         valorSaida := valorEmBRL / taxaDolar
         
      caso 3: // Saída é EUR
         valorSaida := valorEmBRL / taxaEuro
   fimescolha

   // --- ETAPA 6: Exibir Resultado ---
   escreval
   escreval("------------------------------------")
   escreval("Resultado da Conversão:")
   escreval(valorEntrada:0:2, " ", obterSimboloMoeda(unidadeEntrada), " = ", valorSaida:0:2, " ", obterSimboloMoeda(unidadeSaida))
   escreval("------------------------------------")
fimprocedimento

//-------------------------------------------------------------
// BLOCO PRINCIPAL
//-------------------------------------------------------------
inicio
   repita
      limpatela()
      escreval("--- Conversor de Moedas Universal ---")
      
      realizarConversao()
      
      escreval
      escreva("Deseja realizar uma nova conversão? (S/N): ")
      leia(continuar)
      
   ate (maiusc(continuar) = "N")
   
   limpatela()
   escreval("Obrigado por usar o conversor.")
fimalgoritmo
