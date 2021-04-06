### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 3c7aaa30-95a0-11eb-0ef2-b90c889e11dd
begin
	let
		env = mktempdir()
		import Pkg
		Pkg.activate(env)
		Pkg.Registry.update()
		Pkg.add(Pkg.PackageSpec(;name="PlutoUI", version="0.6.7-0.6"))
	end
	using PlutoUI
end

# ╔═╡ e4dd9b82-8b5d-11eb-3ac1-8dac53856c8f
md"""
# Controle de fluxo
As vezes temos que decidir para onde nosso programa vai, qual caminho tomar
"""

# ╔═╡ 02068320-8b5e-11eb-0b4f-89dc3916c2b3
function helloGoodbye(word)
	if(word=="hello")
		return "Hi!"
	else
		return "bye"
	end
end

# ╔═╡ 3bf34f00-8b5e-11eb-0568-9187b8cd7a6b
#teste a função de cima
helloGoodbye("hello")

# ╔═╡ 3a9ff400-8b5e-11eb-3ea9-afbe78f00e29
#Na verdade, não precisamos do else nesse caso
function helloGoodbye2(word)
	if(word=="hello")
		return "Hi!"
	end
	return "bye"
end

# ╔═╡ 53c3a710-8b5e-11eb-0769-9bd6ae0f3bfb
#teste

# ╔═╡ 5823a5d0-8b5e-11eb-0236-a33e7d5b465e
function helloFulano(word, fulano)
	if(word === "hello")
		complemento = "Hi!"
	else
		complemento = "Bye"
	end
	return fulano * ", " * complemento
end

# ╔═╡ a7986060-8b5e-11eb-3153-5753fabff1ab
helloFulano("hello", "Marcos")

# ╔═╡ c1ad2a30-8b5e-11eb-3c2d-5b9b0b3e41df
#Teste

# ╔═╡ c57ccfd0-8b5e-11eb-051f-8b1507ef9438
#O que o operador * faz com strings? Teste ele aqui nessa célula

# ╔═╡ 4b7e6260-8b5f-11eb-134a-4f78b260539c
#Você consegue pensar em outra forma de escrever a função helloFulano usando a função helloGoodbye?

# ╔═╡ d61c2ed0-8b5e-11eb-20f4-af01665abe71
#Mais condições
function porIdade(idade)
	if(idade < 12)
		return "criança"
	elseif(idade<18)
		return "jovem"
	elseif(idade<30)
		return "Adulto"
	end
	return "não sei :/"
end

# ╔═╡ 38456cc0-8b5f-11eb-02af-9f7ac433e771
porIdade(5)

# ╔═╡ c64cb810-8b60-11eb-3bd1-4f50834759e0
#Modifique a função acima para que ela retorne também se o indivíduo é 'Adulto+' de 35 a 55 anos ou idoso, maior de 55 anos 

# ╔═╡ a984edc0-8ff6-11eb-2ba3-eb88cb1ab54f
function titulosBR(time)
	if(time === "Flamengo") return 8 end
	if(time === "Vasco") return 4 end
	if(time === "Fluminense") return 4 end
	if(time === "Botafogo") return 1 end
	return "Time desconhecido"
end

# ╔═╡ e13fbe70-8ff6-11eb-1d55-0d00f50f46c0
titulosBR("Flamengo")

# ╔═╡ 150befd0-8ff7-11eb-2b4e-f93fe31b214a
#Adicione os times de SP

# ╔═╡ 1dd36760-8ff7-11eb-2426-abc57ab543cb
#Faça uma função que retorne a marca dos carros {208, pallio, uno, gol, saveiro}, caso seja outro carro, retorne "carro não cadastrado"

# ╔═╡ 31a9eb00-8b61-11eb-018d-41368260d891
function estaOrdenado(a,b,c)
	if(a < b && a < c && b < c)
		return "sim"
	end
	return "não"
end

# ╔═╡ d99ff6fe-8b61-11eb-171f-09ecc7b89e4e
estaOrdenado(1,2,0)

# ╔═╡ 3d9e54a0-8ff8-11eb-1ed7-1fe25e430097
#Faça uma função que verifique se está ordenado em ordem decrescente

# ╔═╡ 5b0b3f92-8ff7-11eb-2283-1be2752d4c57
function ehPar(num)
	if(num%2 == 0) return "É par" end
	return "Não é par"
end

# ╔═╡ e7090a30-8b61-11eb-3d1c-074365d44955
ehPar(20224876)

# ╔═╡ a5878bf0-8ff7-11eb-2434-efbebb86a86a
# Faça uma função que diga se um número é impar

# ╔═╡ b7bfb362-8ff7-11eb-1e88-31004960bc3f
function ehGrande(palavra)
	tamanho = length(palavra)
	if(tamanho < 10) return "É pequena" end
	return "É grande"
end

# ╔═╡ 7a78a380-8ff8-11eb-2444-711a9394d5e8
ehGrande("hello")

# ╔═╡ 86f7088e-8ff8-11eb-1ab4-6bdcdc241dd9
#Adicione a opção "É muito grande", quando uma palavra tiver mais que 20 letras

# ╔═╡ a27e4e20-8ff8-11eb-0dee-b9905083eae8
#Blocos de if podem ter várias linhas de código
function muitoIf(palavra)
	if(ehGrande(palavra) === "É pequena")
		novaPalavra = palavra * "maiorAgora"
		tamanho = length(novaPalavra)
	else
		novaPalavra = "=="*palavra*"=="
		tamanho = length(novaPalavra)
	end
	return (novaPalavra, tamanho)
end

# ╔═╡ 406a7782-8ff9-11eb-0c4c-d9baac27cd5e
muitoIf("paralelepípedo")

# ╔═╡ 27a7e280-8b5f-11eb-0837-f7a5f2087be4
#Faça uma função que diga se um número é menor que 0

# ╔═╡ 215bd5c0-8b60-11eb-0af9-932848c10a0d
#A soma dos ângulos de um triângulo é 180º, faça uma função que diga se três ângulos: a, b, c formam um triângulo

# ╔═╡ 4a9c4a50-8b60-11eb-15e5-470f4c50b858
#Faça uma função que diga se três varinhas de tamanhos a, b e c (em ordem crescente) podem formar um triângulo

# ╔═╡ 8723972e-8b60-11eb-31ea-b98c1cb1d5d4
#Faça uma função que verifique se quatro varinhas, a, b, c e d formam um quadrado, um retângulo ou nenhum dos dois

# ╔═╡ ae39d850-959e-11eb-166f-5d7b7f779925
md"""
### Ternários
"""

# ╔═╡ ca55bcc0-959e-11eb-2c03-016558d30c43
@bind condição CheckBox()

# ╔═╡ b88c0e90-959e-11eb-041c-d78147810726
condição ? "marcado" : "desmarcado"

# ╔═╡ d7ce2750-95a0-11eb-2831-b377b463e893
true ? "marcado" : "desmarcado"

# ╔═╡ ef848ec0-95a0-11eb-213c-81f9e43a0d21
false ? "marcado" : "desmarcado"

# ╔═╡ 21013fee-95a3-11eb-3e7f-fda11417a224
id(x)=x

# ╔═╡ 3939cfb0-95a3-11eb-363f-ab016d26cca2
quadrado(x)=x^2-20

# ╔═╡ 1e6411c0-95a1-11eb-3008-ebff83373c35
@bind x Slider(0:0.05:10)

# ╔═╡ 3b1642c0-95a1-11eb-355d-ff7bc90fc1ce
x>5 ? "acima da média" : "abaixo da média"

# ╔═╡ e034d9de-95a3-11eb-0658-5b7a955de0c3
x>5 ? quadrado(x) : id(x)

# ╔═╡ Cell order:
# ╠═3c7aaa30-95a0-11eb-0ef2-b90c889e11dd
# ╠═e4dd9b82-8b5d-11eb-3ac1-8dac53856c8f
# ╠═02068320-8b5e-11eb-0b4f-89dc3916c2b3
# ╠═3bf34f00-8b5e-11eb-0568-9187b8cd7a6b
# ╠═3a9ff400-8b5e-11eb-3ea9-afbe78f00e29
# ╠═53c3a710-8b5e-11eb-0769-9bd6ae0f3bfb
# ╠═5823a5d0-8b5e-11eb-0236-a33e7d5b465e
# ╠═a7986060-8b5e-11eb-3153-5753fabff1ab
# ╠═c1ad2a30-8b5e-11eb-3c2d-5b9b0b3e41df
# ╠═c57ccfd0-8b5e-11eb-051f-8b1507ef9438
# ╠═4b7e6260-8b5f-11eb-134a-4f78b260539c
# ╠═d61c2ed0-8b5e-11eb-20f4-af01665abe71
# ╠═38456cc0-8b5f-11eb-02af-9f7ac433e771
# ╠═c64cb810-8b60-11eb-3bd1-4f50834759e0
# ╠═a984edc0-8ff6-11eb-2ba3-eb88cb1ab54f
# ╠═e13fbe70-8ff6-11eb-1d55-0d00f50f46c0
# ╠═150befd0-8ff7-11eb-2b4e-f93fe31b214a
# ╠═1dd36760-8ff7-11eb-2426-abc57ab543cb
# ╠═31a9eb00-8b61-11eb-018d-41368260d891
# ╠═d99ff6fe-8b61-11eb-171f-09ecc7b89e4e
# ╠═3d9e54a0-8ff8-11eb-1ed7-1fe25e430097
# ╠═5b0b3f92-8ff7-11eb-2283-1be2752d4c57
# ╠═e7090a30-8b61-11eb-3d1c-074365d44955
# ╠═a5878bf0-8ff7-11eb-2434-efbebb86a86a
# ╠═b7bfb362-8ff7-11eb-1e88-31004960bc3f
# ╠═7a78a380-8ff8-11eb-2444-711a9394d5e8
# ╠═86f7088e-8ff8-11eb-1ab4-6bdcdc241dd9
# ╠═a27e4e20-8ff8-11eb-0dee-b9905083eae8
# ╠═406a7782-8ff9-11eb-0c4c-d9baac27cd5e
# ╠═27a7e280-8b5f-11eb-0837-f7a5f2087be4
# ╠═215bd5c0-8b60-11eb-0af9-932848c10a0d
# ╠═4a9c4a50-8b60-11eb-15e5-470f4c50b858
# ╠═8723972e-8b60-11eb-31ea-b98c1cb1d5d4
# ╟─ae39d850-959e-11eb-166f-5d7b7f779925
# ╠═ca55bcc0-959e-11eb-2c03-016558d30c43
# ╠═b88c0e90-959e-11eb-041c-d78147810726
# ╠═d7ce2750-95a0-11eb-2831-b377b463e893
# ╠═ef848ec0-95a0-11eb-213c-81f9e43a0d21
# ╠═21013fee-95a3-11eb-3e7f-fda11417a224
# ╠═3939cfb0-95a3-11eb-363f-ab016d26cca2
# ╠═1e6411c0-95a1-11eb-3008-ebff83373c35
# ╠═3b1642c0-95a1-11eb-355d-ff7bc90fc1ce
# ╠═e034d9de-95a3-11eb-0658-5b7a955de0c3
