### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

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

# ╔═╡ 606e1dd0-8b61-11eb-1fe1-1f014e7d2145
sort([1, 5, 2, 7, 0])

# ╔═╡ 31a9eb00-8b61-11eb-018d-41368260d891
function estaOrdenado(a,b,c)
	if(a < b && a < c && b < c)
		return "sim"
	end
	return "não"
end

# ╔═╡ d99ff6fe-8b61-11eb-171f-09ecc7b89e4e
estaOrdenado(1,2,0)

# ╔═╡ e7090a30-8b61-11eb-3d1c-074365d44955


# ╔═╡ 27a7e280-8b5f-11eb-0837-f7a5f2087be4
#Faça uma função que diga se um número é menor que 0

# ╔═╡ 215bd5c0-8b60-11eb-0af9-932848c10a0d
#A soma dos ângulos de um triângulo é 180º, faça uma função que diga se três ângulos: a, b, c formam um triângulo

# ╔═╡ 4a9c4a50-8b60-11eb-15e5-470f4c50b858
#Faça uma função que diga se três varinhas de tamanhos a, b e c (em ordem crescente) podem formar um triângulo

# ╔═╡ 8723972e-8b60-11eb-31ea-b98c1cb1d5d4
#Faça uma função que verifique se quatro varinhas, a, b, c e d formam um quadrado, um retângulo ou nenhum dos dois

# ╔═╡ Cell order:
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
# ╠═606e1dd0-8b61-11eb-1fe1-1f014e7d2145
# ╠═31a9eb00-8b61-11eb-018d-41368260d891
# ╠═d99ff6fe-8b61-11eb-171f-09ecc7b89e4e
# ╠═e7090a30-8b61-11eb-3d1c-074365d44955
# ╠═27a7e280-8b5f-11eb-0837-f7a5f2087be4
# ╠═215bd5c0-8b60-11eb-0af9-932848c10a0d
# ╠═4a9c4a50-8b60-11eb-15e5-470f4c50b858
# ╠═8723972e-8b60-11eb-31ea-b98c1cb1d5d4