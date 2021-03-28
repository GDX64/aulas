### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ c5af7c70-8a49-11eb-17b3-5bad477f9fbd
md"""
 # Sistemas numéricos Binários

Por que contamos até 10? Poderia ser diferente?

Nosso sistema numérico padrão tem dez dígitos {0, 1, 2, ..., 9}, dizemos que temos base 10.

### Como nosso sistema funciona

Contamos de 0 até 9, que é a quantidade máxima de dígitos que temos, quando acabam os dígitos, voltamos ao '0', mas adicionamos mais uma casa, vamos para o 10. Todos os números compostos de mais de um algarismo na base 10 podem ser decompostos da seguinte maneira:

$231=2*10^2+3*10^1+1*10^0$

### Como seria uma base 12

Se contássemos tívessemos base 12, deveríamos adicionar mais dois algarismos, por exemplo, poderiamos contar {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b}, assim o maior algarismo na base 12 é o 'b' que corresponderia a 11 em decimal (em base 10).

E leríamos o número 2a1 como:

$2a1_{base12} = 2*12^2 + 10*12^1 + 1*12^0 = 409_{base10}$
"""

# ╔═╡ ac42043e-8a4b-11eb-1527-cf56d7bcfb33
md"""
 #### Q) Como é $b3_{base 12}$ na base 10?

-  E $a000$?
"""

# ╔═╡ e7e9bc00-8a4a-11eb-299d-bf69a6cbb431


# ╔═╡ e5e44f10-8a4a-11eb-00b7-2b0d37475f86
md"""
### Base 2?
A menor base que podemos ter é 2, um sistema numérico com apenas dois algarismos, que poderiam ser {🍌, 🍎}, sendo 🍌 o menos significativo e 🍎 o mais significativo, assim 

$x=🍎🍎🍌🍎🍎🍌🍌🍎🍌$ 

poderia perfeitamente ser um número. Mas pra facilitar um pouco as coisas, vamos escolher símbolos melhores e usar {0, 1} mesmo. assim:

$x=110110010$

é o mesmo número das bananas e maçãs

Um algarismo em base 2 também é chamado de bit. Um bit pode ser então 0 ou 1

"""

# ╔═╡ 04782670-8a4d-11eb-2177-6dca4f1eaaf5
# Uma função que mostra os 4 p
toBits(x) = string(x, base=2)

# ╔═╡ 32533920-8a4a-11eb-13fb-991509eedde1
toBits(213) #213 em binário

# ╔═╡ 5d717b20-8a5a-11eb-1203-c7f8a310977f
#Lembrando que o ponto antes de uma função faz com que essa função seja aplicada para todos os elementos do argumento, e 1:5 são os inteiros de 1 até 5 
toBits.(1:5) 

# ╔═╡ 2edef9f0-8a4a-11eb-1592-8d793e7e3a9c
map((keyVal)->keyVal[1]=>keyVal[2], zip(1:5, toBits.(1:5)))

# ╔═╡ abe261f2-8b65-11eb-14ac-0feb36c80a82
md"""
$110$
$+1$
$111$

"""

# ╔═╡ a942e270-8b66-11eb-3f3a-d5ee8293a540


# ╔═╡ ad91ca30-8b66-11eb-2dfe-951648643ec6
2^0*1 + 2^1*0 + 2^2*1 + 2^3*0 + 2^4*1

# ╔═╡ f4c442c2-8b66-11eb-29e1-13970af307a0


# ╔═╡ 2b8dd320-8a4a-11eb-00fd-7f35c39e5837
md""" #### Q) Quais são as representações em binário dos números de 6 até 10?

-	Use a função toBits pra conferir suas respostas
"""

# ╔═╡ b2d0ba20-8a5c-11eb-2d17-13d3cd410c21


# ╔═╡ 50915190-8a5b-11eb-3076-6378563a6dc0
md"""
### E casas depois da vírgula?

Também temos uma analogia clara com a base decimal, ou qualquer outra base.

$0.15_{b10} = 1*10^{-1}+5*10^{-2}$

$0.101_{b2}=1*2^{-1}+0*2^{-2}+1*2^{-3} = 0.5 + 0.125 = 0.625$

- Quanto é 0.111111 em base 10?
- O que acontece quando adicionamos infinitos uns depois do ponto (como 0.111111111...)? Isso te lembra alguma coisa?
"""

# ╔═╡ 618ce770-8ab5-11eb-00c7-31858538539f


# ╔═╡ e408f4d0-8a49-11eb-0134-65106648425d
#Podemos escrever binários em júlia da seguinte maneira
Int(0b101)

# ╔═╡ e0209710-8a49-11eb-0233-2d6ff2c30730
#Escreva o número 21 em binário

# ╔═╡ 9c607a80-8b5d-11eb-05ac-a1be7f3a7728
#Escreva 33 em binário

# ╔═╡ 311a6760-8ac0-11eb-160a-f50e3aa6ef89
md"""
$(Resource("https://cdn.awsli.com.br/600x450/608/608801/produto/31587896/03e1b63e08.jpg"))
"""

# ╔═╡ 860e9412-8ab8-11eb-3ecc-35ac6dee42cd
md"""
Números binários são muito úteis para computadores, porque eles são simples. É assim que toda a informação de qualquer arquivo de um computador é guardada na memória. Também é com binários que o computador faz cáculos na CPU e GPU.

Quando juntamos 8 bits, dizemos que temos 1 byte. Se temos 1024 bytes ($2^{10}$), temos 1KB (um kilo byte), com 1024 KBs, temos 1MB, com 1024MB temos 1GB...

*As operadoras de internet em geral vendem as velocidates em bits, não bytes. Por isso uma internet de 100Mb/s (com b minúsculo) consegue fazer downloads de cerca de 100/8 MB/s ou 12.5 MB/s

### Como computadores guardam os números?

Existem vários níveis de para guardar números. Números inteiros podem ser guardados em diferentes formatos, com diferentes números de bytes. Um número pequeno é pode ser guardado no formato UInt8, númeors inteiros positivos de até 1 byte, ou 8 bits.

O maior número que podemos guardar nesse formato é 255, ou $2^8 - 1$
"""

# ╔═╡ 7d767470-8ab9-11eb-0357-e54ecfee6b09
UInt8(255) # UInt8 mostra os valores no console como hexadecimal (base16)

# ╔═╡ 0c831740-8aba-11eb-0e7c-9533edaa46c1
Int64(UInt8(255)) #Podemos converter para o formato Int64, que é o formato de inteiro padrão

# ╔═╡ 6aa41360-8aba-11eb-2fe4-df52c28b451d
#Tente representar um UInt8 maior que 255

# ╔═╡ b1903420-8aba-11eb-1d09-d50c32f6a497
#Podemos somar UInt8 
UInt8(5)+UInt8(3)

# ╔═╡ a448b2b0-8aba-11eb-35d5-69f6761d1232
#Um caso engraçado
UInt8(255)+UInt8(1)
#Por que isso acontece?

# ╔═╡ 832f7e10-8aba-11eb-03ee-a77c97093dd3
#Também temos o UInt16, o que você acha que ele é?
UInt16(10)

# ╔═╡ ed73039e-8aba-11eb-1835-3bc83dd4c0c2
#Qual é o maior número que podemos representar em UInt16?

# ╔═╡ 08a5c090-8abb-11eb-3c15-cdcad890f213
md"""
### Função typeof

Essa função fala qual é o tipo de uma variável
"""

# ╔═╡ 126cf4de-8abb-11eb-3a42-db3bfdc25ca1
tipoInteiroNormal = 10 + 1

# ╔═╡ 1ef5ba30-8abb-11eb-2941-89df62de7247
typeof(tipoInteiroNormal)

# ╔═╡ 3a67a300-8abb-11eb-2fc3-e10470cafa32
tipoTexto = "Hello there"

# ╔═╡ 4c376bb0-8abb-11eb-248a-77b7225157b6
typeof(tipoTexto)

# ╔═╡ 594a6fa0-8abb-11eb-01d3-279a551f8738
# qual é o tipo de 1/2?

# ╔═╡ 655440ee-8abb-11eb-2887-93aeab934d2c
#qual é o tipo de [1,2,3]

# ╔═╡ 1c8f4c10-8abc-11eb-0dcf-f3dc977edb04
md"""
### No final das contas, tudo é bit
"""

# ╔═╡ 6acba31e-8abb-11eb-1165-dfc797b503bc
#Tudo são bits no final das contas
textToBits(txt) = txt |> codeunits |> x->map(bitstring, x) |> x->join(x, "")

# ╔═╡ f48a4840-8abc-11eb-23e6-c7dfc5db1462
helloEmBits=textToBits("Hello")

# ╔═╡ a298a6ce-8abc-11eb-1124-7fd2f3bc8f20
#A função length te fala o tamanho de uma string (texto)
length("Hello")

# ╔═╡ 205893a0-8abd-11eb-2945-9154db08c379
length(helloEmBits)

# ╔═╡ 40aaa7b0-8abd-11eb-1801-310bba84d544
#Quantos bits o computador gasta pra guardar seu nome?

# ╔═╡ 5aad2200-8abd-11eb-1bc7-954e499ad949
md"""
### No final das contas, tudo é byte
Os computadores em geral não manipulam bits individualmente, eles manibulam bytes direto.

Já ouviu falar de videogame de 8 bits?

A função sizeof te dá o tamanho de uma variável na memória em bytes
"""

# ╔═╡ b7a0c1b0-8abd-11eb-2dd7-5dcb6523d1c5
sizeof(helloEmBits)

# ╔═╡ d3b1d0b0-8abd-11eb-353b-6fb7a3914f62
sizeof("Hello")

# ╔═╡ d9dea030-8abd-11eb-13dd-c9106a6c79ee
#Qual é o tamanho do seu nome na memória do computador em bytes?

# ╔═╡ e4bb632e-8abd-11eb-1c47-eb6c03bf5333
#Qual é o tamanho em bytes desse número?
#Qual é o tipo dele?
umNumero = 500/399

# ╔═╡ 97a21d70-8ac0-11eb-16d0-8998680224ba
md"""
#### Desafio
"""

# ╔═╡ a3c89e80-8ac0-11eb-3460-231c78b80b87
#sizeof retorna o tamanho em bytes, length retorna a quantidade de caracteres
sizeof("hello")==length("Hello")

# ╔═╡ b145aee2-8ac0-11eb-290c-1f0bcf08c0c5
#Faça uma função que compare o tamanho de uma string em letras com o seu tamanho em bytes (diga se os dois são iguais ou não)

# ╔═╡ 1b247f30-8ac1-11eb-0eda-c11f0b917fe5
#Dica: uma função que fala se dois números são iguais
sameNumber(x, y) = x == y

# ╔═╡ 4097bf20-8ac1-11eb-09ce-53a67e2b5d79
sameNumber(10, 10.0)

# ╔═╡ c48e34e2-8ac0-11eb-0295-dfaf7828beb7
#Há alguma string para a qual essa função retorna false? 

# ╔═╡ Cell order:
# ╟─c5af7c70-8a49-11eb-17b3-5bad477f9fbd
# ╟─ac42043e-8a4b-11eb-1527-cf56d7bcfb33
# ╠═e7e9bc00-8a4a-11eb-299d-bf69a6cbb431
# ╟─e5e44f10-8a4a-11eb-00b7-2b0d37475f86
# ╠═04782670-8a4d-11eb-2177-6dca4f1eaaf5
# ╠═32533920-8a4a-11eb-13fb-991509eedde1
# ╠═5d717b20-8a5a-11eb-1203-c7f8a310977f
# ╠═2edef9f0-8a4a-11eb-1592-8d793e7e3a9c
# ╠═abe261f2-8b65-11eb-14ac-0feb36c80a82
# ╠═a942e270-8b66-11eb-3f3a-d5ee8293a540
# ╠═ad91ca30-8b66-11eb-2dfe-951648643ec6
# ╠═f4c442c2-8b66-11eb-29e1-13970af307a0
# ╟─2b8dd320-8a4a-11eb-00fd-7f35c39e5837
# ╠═b2d0ba20-8a5c-11eb-2d17-13d3cd410c21
# ╟─50915190-8a5b-11eb-3076-6378563a6dc0
# ╠═618ce770-8ab5-11eb-00c7-31858538539f
# ╠═e408f4d0-8a49-11eb-0134-65106648425d
# ╠═e0209710-8a49-11eb-0233-2d6ff2c30730
# ╠═9c607a80-8b5d-11eb-05ac-a1be7f3a7728
# ╟─311a6760-8ac0-11eb-160a-f50e3aa6ef89
# ╟─860e9412-8ab8-11eb-3ecc-35ac6dee42cd
# ╠═7d767470-8ab9-11eb-0357-e54ecfee6b09
# ╠═0c831740-8aba-11eb-0e7c-9533edaa46c1
# ╠═6aa41360-8aba-11eb-2fe4-df52c28b451d
# ╠═b1903420-8aba-11eb-1d09-d50c32f6a497
# ╠═a448b2b0-8aba-11eb-35d5-69f6761d1232
# ╠═832f7e10-8aba-11eb-03ee-a77c97093dd3
# ╠═ed73039e-8aba-11eb-1835-3bc83dd4c0c2
# ╠═08a5c090-8abb-11eb-3c15-cdcad890f213
# ╠═126cf4de-8abb-11eb-3a42-db3bfdc25ca1
# ╠═1ef5ba30-8abb-11eb-2941-89df62de7247
# ╠═3a67a300-8abb-11eb-2fc3-e10470cafa32
# ╠═4c376bb0-8abb-11eb-248a-77b7225157b6
# ╠═594a6fa0-8abb-11eb-01d3-279a551f8738
# ╠═655440ee-8abb-11eb-2887-93aeab934d2c
# ╠═1c8f4c10-8abc-11eb-0dcf-f3dc977edb04
# ╠═6acba31e-8abb-11eb-1165-dfc797b503bc
# ╠═f48a4840-8abc-11eb-23e6-c7dfc5db1462
# ╠═a298a6ce-8abc-11eb-1124-7fd2f3bc8f20
# ╠═205893a0-8abd-11eb-2945-9154db08c379
# ╠═40aaa7b0-8abd-11eb-1801-310bba84d544
# ╟─5aad2200-8abd-11eb-1bc7-954e499ad949
# ╠═b7a0c1b0-8abd-11eb-2dd7-5dcb6523d1c5
# ╠═d3b1d0b0-8abd-11eb-353b-6fb7a3914f62
# ╠═d9dea030-8abd-11eb-13dd-c9106a6c79ee
# ╠═e4bb632e-8abd-11eb-1c47-eb6c03bf5333
# ╟─97a21d70-8ac0-11eb-16d0-8998680224ba
# ╠═a3c89e80-8ac0-11eb-3460-231c78b80b87
# ╠═b145aee2-8ac0-11eb-290c-1f0bcf08c0c5
# ╠═1b247f30-8ac1-11eb-0eda-c11f0b917fe5
# ╠═4097bf20-8ac1-11eb-09ce-53a67e2b5d79
# ╠═c48e34e2-8ac0-11eb-0295-dfaf7828beb7
