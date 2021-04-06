### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ a5cbbd9e-9599-11eb-0636-99711afa6af7
md"""
# Loops e escopo

Escopo significa que váriáveis estão disponíveis em um determinado trecho do código
"""

# ╔═╡ d186b2a0-959a-11eb-2d3a-155d6fdc67ed
#A palavra mágica 'begin' (começar, em português) define um novo escopo local
let
	soma=0
	um=1
	dois=2
	três=3
	soma = um+dois+três #A última linha do bloco é o valor retornado pelo bloco
end

# ╔═╡ 22cc03f0-959a-11eb-0416-734215d40d56
# As váriaveis um, dois e três não existem fora do bloco 'let'
dois

# ╔═╡ c4ae0320-959b-11eb-1479-c72dc084081b
#Begin é igual ao let, com uma diferença
salada = begin
	fruta1="maçã"
	fruta2="banana"
	fruta1*"+"*fruta2 #A última linha do bloco é o valor retornado pelo bloco
end

# ╔═╡ f51bc740-959b-11eb-31e5-799754193022
#fruta1 e fruta2 escapam do bloco e fogem pro resto do escopo
(fruta1, fruta2)

# ╔═╡ 3e4fb522-959c-11eb-1bba-f57d5efba44f
#Funções introduzem novos escopos locais, como let, variáveis declaradas dentro de uma função não são acessíveis fora dela
function hello()
	greeting="Hello there" 
	#a última linha de uma função também é o que essa função retorna
	#é o mesmo que se fosse 'return greeting'
end

# ╔═╡ 858254c0-959c-11eb-248b-4373d343073c
greetig

# ╔═╡ 8f3df050-959c-11eb-0ef6-05c9e0a9f5cf
hello()

# ╔═╡ 34f8b250-959d-11eb-15ef-5f843b34839e
#Blocos podem ser declarados dentro de funções
function testLet(idioma)
	pontuação=let
		if(idioma == "pt-br")
			separador = ","
		else
			separador = "."
		end
		separador
	end
	#separador
	return "1"*pontuação*"000"
end

# ╔═╡ e93bda30-959d-11eb-15c9-c5967140675a
testLet("en-us")

# ╔═╡ 1a1dbce0-959e-11eb-1e9d-6b5746ff8642
#Só por curiosidade, a mesma função de cima em uma linha
oneLine(idioma)="1$(idioma == "pt-br" ? "," : ".")000"

# ╔═╡ 59ca1780-959e-11eb-2ae0-277c74e563c0
oneLine("pt-br")

# ╔═╡ 6bd8c450-95a6-11eb-298e-8b049673a2b5
dez=10

# ╔═╡ 38b87fd0-95a5-11eb-3634-71963194ea6c
function exEscopo(numero)
	resultado = let
		#dez ?
		res = dez
		res = res + numero
	end
	#res ?
	#final ?
	if(resultado)
		final=resultado+numero
	else
		final = resultado
	end
	#final ?
	return final
end

# ╔═╡ 65d5c3f0-95a6-11eb-04e3-5d5d8d40e04d
#final ?
# resultado ?
#res ?

# ╔═╡ ead83600-95a6-11eb-378d-3d3bbff024e3
md""" ### Loops """

# ╔═╡ f2700730-95a6-11eb-0387-1d8bb4aa7e49
let
	soma = 0
	for i ∈ [1,2,3,4,5]
		soma = soma + i
	end
	soma
end

# ╔═╡ 165ddfa0-95a7-11eb-1404-0f9ba385e3bf
let
	acumulador=""
	for letra in "hello"
		acumulador = acumulador * "-" * letra
	end
	acumulador
end

# ╔═╡ ba29c9ee-95a7-11eb-046a-e1bea0c652bc
function contaLetraA(palavra)
	conta=0
	for letra in palavra
		if(letra == 'a')
			conta = conta + 1
		end
	end
	conta
end

# ╔═╡ 2caaaf80-95a8-11eb-2a3c-f1d7f1ebb987
contaLetraA("Paraguai")

# ╔═╡ d9be8c00-95a8-11eb-0778-9712e6eb4abe


# ╔═╡ 035efae0-95a9-11eb-0dcf-b3c304d08739


# ╔═╡ 7fd02090-95a9-11eb-189b-c981735dc010
function aPorAlpha(palavra)
	acc=""
	for letra in palavra
		if(letra == 'a') 
			acc = acc*'α'
		else
			acc = acc * letra
		end
	end
	acc
end

# ╔═╡ 0e54ceae-95aa-11eb-0b57-ff9d214521c8
aPorAlpha("Paraguai")

# ╔═╡ 23ae0c40-95aa-11eb-39ed-a7895cb74f30


# ╔═╡ 52f307d2-95aa-11eb-13a1-f74794396d02


# ╔═╡ Cell order:
# ╠═a5cbbd9e-9599-11eb-0636-99711afa6af7
# ╠═d186b2a0-959a-11eb-2d3a-155d6fdc67ed
# ╠═22cc03f0-959a-11eb-0416-734215d40d56
# ╠═c4ae0320-959b-11eb-1479-c72dc084081b
# ╠═f51bc740-959b-11eb-31e5-799754193022
# ╠═3e4fb522-959c-11eb-1bba-f57d5efba44f
# ╠═858254c0-959c-11eb-248b-4373d343073c
# ╠═8f3df050-959c-11eb-0ef6-05c9e0a9f5cf
# ╠═34f8b250-959d-11eb-15ef-5f843b34839e
# ╠═e93bda30-959d-11eb-15c9-c5967140675a
# ╠═1a1dbce0-959e-11eb-1e9d-6b5746ff8642
# ╠═59ca1780-959e-11eb-2ae0-277c74e563c0
# ╠═6bd8c450-95a6-11eb-298e-8b049673a2b5
# ╠═38b87fd0-95a5-11eb-3634-71963194ea6c
# ╠═65d5c3f0-95a6-11eb-04e3-5d5d8d40e04d
# ╟─ead83600-95a6-11eb-378d-3d3bbff024e3
# ╠═f2700730-95a6-11eb-0387-1d8bb4aa7e49
# ╠═165ddfa0-95a7-11eb-1404-0f9ba385e3bf
# ╠═ba29c9ee-95a7-11eb-046a-e1bea0c652bc
# ╠═2caaaf80-95a8-11eb-2a3c-f1d7f1ebb987
# ╠═d9be8c00-95a8-11eb-0778-9712e6eb4abe
# ╠═035efae0-95a9-11eb-0dcf-b3c304d08739
# ╠═7fd02090-95a9-11eb-189b-c981735dc010
# ╠═0e54ceae-95aa-11eb-0b57-ff9d214521c8
# ╠═23ae0c40-95aa-11eb-39ed-a7895cb74f30
# ╠═52f307d2-95aa-11eb-13a1-f74794396d02
