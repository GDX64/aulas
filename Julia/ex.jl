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

# ╔═╡ 55353a60-73a2-11eb-1045-6dc5ee0e431b
using Plots

# ╔═╡ 11d3acb0-73b2-11eb-1825-eba4787ad4bd
using LinearAlgebra

# ╔═╡ 5ee0d060-73a2-11eb-03e9-f7fe823b3e04
plotly()

# ╔═╡ 6204c870-746d-11eb-1cd5-4711637f1a8d
md"""## Operações básicas"""

# ╔═╡ 72f04ba0-746d-11eb-0ae0-9328f13c249b
10+9-1

# ╔═╡ 76899f00-746d-11eb-3ec1-27053328e801
2*2.51

# ╔═╡ 7c141400-746d-11eb-1b4e-bbe0a7ec40a8
4^2

# ╔═╡ 809a8680-746d-11eb-2f55-41725f26209f
10/2

# ╔═╡ a3494f40-746d-11eb-0ea3-ffb9aa09d275
(10*(2-1)+3)^2

# ╔═╡ 08a333b0-746e-11eb-3524-978527640d54
1e10*2e-7*3e-2

# ╔═╡ bb8c6650-746d-11eb-32ef-bbf7e5607d87
md"""### Q)
-  qual é o resultado de $1045+4(13^2-3)/3$?
"""

# ╔═╡ ac3aa4c0-73a3-11eb-39eb-dfaef5e5a84a
md""" ## Funções
Uma função leva elementos do conjunto A para o conjunto B
"""

# ╔═╡ be252160-73a3-11eb-1d5d-7fca05f2b665
begin 
	N=25
	scatter(rand(N), rand(N).+2, size=(500, 300), xlims=[0,4], ylims=[0,4], label="A", showaxis=false, grid=:none)
	scatter!(rand(N).+2, rand(N).+2, label="B", xticks=:none, yticks=:none)
	plot!([(0.5,2.5),(2.5,2.5)], arrow=arrow(), color="black", width=2, label="f. A->B")
end

# ╔═╡ 1c0fe6c0-73ae-11eb-0b6a-d3d92e90f80c
md"""uma função que vai dos inteiros para os inteiros $f(x)=x^2$

$f. \mathbb{N} \to \mathbb{N}$
"""

# ╔═╡ fe35b082-73ad-11eb-12a6-fd11deff285c
f(x)=x^2

# ╔═╡ 0f6a98be-73ae-11eb-373f-55016aaa1d93
f(4)

# ╔═╡ e8479082-73ae-11eb-177a-f17f4a58061c
p(x)=x^2+2*x+1

# ╔═╡ f1653e60-73ae-11eb-11c0-c31fe2b8e8e1
p(-1) #Raiz

# ╔═╡ e8435970-746c-11eb-06a7-15bcfb819dbe
p(2)

# ╔═╡ bfefa730-73ae-11eb-2563-7de28ca6f76f
md"""Funções não precisam operar apenas em números, podemos ter uma função f. 😇 -> 😈"""

# ╔═╡ 98707530-73af-11eb-1c46-a35fdf950234
g(x)=x=="😇" ? "😈" : nothing

# ╔═╡ 0586a2c0-73b0-11eb-2aef-c11ddf3ebebc
g("😇")

# ╔═╡ f7ed3b50-73b0-11eb-0888-2bb790de4710
md"""podem ser constantes, retornar sempre a mesma coisa"""

# ╔═╡ 0692ed32-73b1-11eb-3677-b564eaed4813
tmj(x)="🍻"

# ╔═╡ 10e0ddb0-73b1-11eb-160b-e3bd5bdee349
tmj(40)

# ╔═╡ ef0b3070-746c-11eb-2bc7-4359d817bd72
tmj("hello")

# ╔═╡ 364e2e50-746e-11eb-372a-43901f874018
md"""### Q)
-  um quadrado tem lado $l$, escreva uma função que represente o perímetro desse quadrado em função de $l$
-  Escreva uma função que representa a área de um quadrado.
-  Escreva uma função que represente a área de um círculo de raio $r$
-  Escreva uma função que represente o perímetro de um círculo de raio r
"""

# ╔═╡ d6cce970-746e-11eb-0b84-9dcdd6dcdd1c
pi #dica π=pi, é uma constante que vc pode usar em qualquer lugar

# ╔═╡ f7bcc420-746e-11eb-2bc4-9fb87a66a9d6
md"""## Funções de mais de uma variável
As funções podem ter várias variáveis

$soma(x,y)=x+y$
"""

# ╔═╡ 33cac250-746f-11eb-0a63-ef3072f331b0
soma(x, y) = x+y

# ╔═╡ 38caaa90-746f-11eb-0009-f13f4fe47bd2
soma(4,3)

# ╔═╡ 440481b0-746f-11eb-1331-ed0e633841db
md"""### Q)
-  Faça uma função que retorne o perímetro de um retângulo de lados $l$ e $h$
-  Faça uma função que retorne a área de um triângulo de base $b$ e altura $h$
-  Pedrinho vende cachorro-quente a 2 reais, e refrigerante a R\$1.50, faça uma função que receba uma quantidade de cachorros quentes e refrigerantes e retorne o preço de venda dos produtos de Pedrinho. Qual é o preço médio se ele vender 245 cachorros-quentes e 339 refrigerantes? 
"""

# ╔═╡ d07e0112-7470-11eb-2e7b-e798be8e8ce3
md"""### Desafio
A fórmula de báskara é conhecida e temida por todo o mundo

$\frac{-b ± \sqrt{b^2-4ac}}{2a}$

Crie uma função que receba a, b e c resolva ela pra você não ter que perder seu tempo mais
"""

# ╔═╡ 69c09f90-7471-11eb-31ae-5548765d9003
√2 #Dica: \sqrt<tab>=√

# ╔═╡ 323b5970-7453-11eb-3d0c-253b24e71190
md"""## Plotando uma função
Podemos usar a função plot do pacote 'Plots' que importamos no início
"""

# ╔═╡ a64b4370-7453-11eb-0f1b-5d54415d2cd0
plot(f)

# ╔═╡ 5fbee402-7455-11eb-1906-fd870a3b4b0c
md"""### Q)
-  Você consegue plotar o polinômio $pol(t)=(t-2)^2 - 4$?
-  Quais são as raízes desse polinômio olhando no gráfico?
"""

# ╔═╡ a4fd7bd0-7455-11eb-3304-3b4a44070ada
pol(t)=(t-2)^2 - 4

# ╔═╡ ae2d0400-7455-11eb-1c03-2b55efdb2872
plot(pol)

# ╔═╡ ec00e000-7453-11eb-0974-b1beb705abf7
#Também podemos definir o domínio da função usando uma expressão range
domain=0:0.1:2
#a notação 0:0.1:2 internamente na linguagem chama uma função com o nome de range

# ╔═╡ 7cc4a8b0-7454-11eb-0a41-459d5f3f8f46
plot(f, domain)

# ╔═╡ c08456c2-7456-11eb-248d-0542862bc3b0
md"""### Q)
-  Ainda usando a função pol anterior, você consegue plotar somente a parte negativa da fnção?
"""

# ╔═╡ 719ce450-84fa-11eb-1c45-09f6edfec173
md"""
### Q)
- Voltando ao báskara: faça uma função $ \Delta(a, b, c) = \sqrt{b^2-4ac} $
- Componha a função de báskara para a raíz do delta positivo $ r_p(a,b,c) = \frac{-b + \Delta(a,b,c)}{2a} $
- Componha uma função para o delta negativo $ r_n = \frac{-b - \Delta}{2a} $
"""

# ╔═╡ c958d890-7454-11eb-01ee-c7decfe0979a
md"""## Arrays e vetores
Podemos criar vetores com a seguinte notação
"""

# ╔═╡ f4be4ffe-7454-11eb-0883-ed2b79023dee
v=[1, 5, 3, 10]

# ╔═╡ ca2262c0-7457-11eb-3efd-53375fed7523
md"""
`background =` $(@bind stonks_bg html"<input type='color'>")

`grossura = ` $(@bind width html"<input type=range min='1' max='8'>")

`cor da linha = ` $(@bind stonks_color html"<input type='color' value='#ff6465'>")
"""

# ╔═╡ 2087b960-7455-11eb-230d-cdc7a86d9a40
#Vetores também podem ser plotados como pontos
plot(v, title="stonks", color=stonks_color, background=stonks_bg, arrow=arrow(), legend=:none, linewidth=width)

# ╔═╡ 3e8b2282-7455-11eb-33e0-957d838862c9
#Se temos dois vetores, podemos plotá-los como uma sequência de pontos ligados no plano cartesiano
x_ex=[1,2,3,1]

# ╔═╡ 3ef3e480-7457-11eb-0dd7-5d25e75ea6dd
y_ex=[1,3,1,1]

# ╔═╡ 4b70c2f0-7457-11eb-29dd-a1b5d4768e29
plot(x_ex, y_ex)

# ╔═╡ 79340082-7457-11eb-0812-79a41e4a1ab6
md"""### Q)
-  Você consegue plotar um quadrado usando a técnica acima?
-  Um gráfico como esse representa uma função?
"""

# ╔═╡ 31e917d0-73b0-11eb-1211-e52f9c20617c
md"""## Função campo elétrico
$E(q, r) = k_e\frac{q}{r^2}$
$\vec{E}(q, \vec{r}) = k_e\frac{q}{|r|^3}\vec{r}$
"""

# ╔═╡ 3f0ffc70-73b1-11eb-33f9-2d6ad9a08a97
ke=9*10^9

# ╔═╡ 34252fb0-73b1-11eb-23db-fba768f0e7c1
E(q, r)=ke*q/r^2

# ╔═╡ c6df7130-73b1-11eb-000a-ad78ba8d9d5b
E(q, r::Array, initialPos=[0,0]) = ke*q*(r-initialPos)/norm(r-initialPos)^3 #quando R é um vetor

# ╔═╡ 575d9ad2-73b1-11eb-0439-e1ce04798ad5
E(0.001, 10)

# ╔═╡ eb6bd390-73b1-11eb-2deb-a5914ccc4d56
E(1, [1,2], [1,1])

# ╔═╡ 30027f22-7f85-11eb-327c-7f1e3371042f
gr() # trocando o estilo das figuras

# ╔═╡ 35e27dd0-73b6-11eb-3df2-51f4574b5c19
function meshgrid(rangex, rangey=rangex)
	xs = rangex
	ys = rangey

	xxs = [x for x in xs for y in ys]
	yys = [y for x in xs for y in ys]
	return (xxs, yys)
end

# ╔═╡ e6330b90-73b2-11eb-33e0-bd50688a4ed2
function plotEletricField(Eq)
	xxs, yys = meshgrid(-2:0.2:2)
	quiver(xxs, yys, quiver=(x,y)->Eq(1, [x,y]) |> normalize |> x->x./6, c=:viridis, line_z=(x,y)->Eq(1, [x,y]) |> norm |> log10, size=(600,400), xlim=[-2,2], ylim=[-2,2] )
end

# ╔═╡ 70040360-73b8-11eb-0774-41dc546a68d1
@bind qx html"<input type='range' min=-2 max=2 step=0.1>"

# ╔═╡ c8d39be0-73b8-11eb-3bfb-0d8b3584c4cf
@bind qy html"<input type='range' min=-2 max=2 step=0.1>"

# ╔═╡ a5392580-73b6-11eb-283b-7dd02bff61c6
plotEletricField((q, r)->E(q, r)+E(-q, r, [qx,qy]))

# ╔═╡ 2f5e20c2-746c-11eb-08c2-dbfe8afa0cec
md"""### Q)
-  Usando a função campo elétrico, você pode criar uma função força elétrica?

$F_e(q_1, q_2,r)=k_e\frac{q_1q_2}{r^2}$
$F_e(q_1, q_2,r)=E(q_1, r)q_2$

"""

# ╔═╡ 3dca0230-73a1-11eb-1142-fd054984ef0b
md"""## Uma PA
$PA=a_0, \,a_1, \,a_2 ...$
$a_1=a_0+r$
$a_n = a_{n-1} +r$
$pa(n)=pa(n-1)+r$
$pa(0)=a_0$
"""


# ╔═╡ 38d93fb0-73a2-11eb-0752-a3bdfc8886d2
a_0=10

# ╔═╡ 3fa8dee0-73a2-11eb-339a-5b4fddc2f32e
@bind r html"<input type='range' min='0' max='10'>"

# ╔═╡ bea88cc0-73a4-11eb-13d2-d975fea0df63
"r=$r"

# ╔═╡ 4ad034e0-73a1-11eb-37d0-ed0bf19b85e2
function pa(n)
	if(n==0)
		return a_0
	end
	return pa(n-1)+r
end

# ╔═╡ 4680d7f0-73a1-11eb-3527-23979106cd97
pa(10)

# ╔═╡ 6aa97a00-73a2-11eb-3a6a-4d6ac4343075
pontos=[(x, pa(x)) for x in 1:10]

# ╔═╡ 975972d0-73a2-11eb-0288-81f5a09a6fd7
plot(pontos)

# ╔═╡ 08b95800-73a3-11eb-3f0c-e1842196e2f4
pa2(n)=a_0+r*n

# ╔═╡ 3a1d14e0-73a3-11eb-1bf3-e7710c648e0c
pontos2=[(x, pa2(x)) for x in 1:10]

# ╔═╡ 52a460e0-73a3-11eb-2f0c-39dccb5dd579
plot(pontos2)

# ╔═╡ 57126960-73a3-11eb-17fb-9900ca71404d
md"""## Uma PG
$PG=g_0, \,g_1, \,g_2 ...$
$g_1=g_0*r$
$g_n = g_{n-1}*r$
$pg(n)=pg(n-1)*r$
$pg(0)=g_0$
"""

# ╔═╡ 34cdb330-744a-11eb-2fbe-7bc8800b38ed


# ╔═╡ Cell order:
# ╠═55353a60-73a2-11eb-1045-6dc5ee0e431b
# ╠═5ee0d060-73a2-11eb-03e9-f7fe823b3e04
# ╟─6204c870-746d-11eb-1cd5-4711637f1a8d
# ╠═72f04ba0-746d-11eb-0ae0-9328f13c249b
# ╠═76899f00-746d-11eb-3ec1-27053328e801
# ╠═7c141400-746d-11eb-1b4e-bbe0a7ec40a8
# ╠═809a8680-746d-11eb-2f55-41725f26209f
# ╠═a3494f40-746d-11eb-0ea3-ffb9aa09d275
# ╠═08a333b0-746e-11eb-3524-978527640d54
# ╟─bb8c6650-746d-11eb-32ef-bbf7e5607d87
# ╟─ac3aa4c0-73a3-11eb-39eb-dfaef5e5a84a
# ╟─be252160-73a3-11eb-1d5d-7fca05f2b665
# ╟─1c0fe6c0-73ae-11eb-0b6a-d3d92e90f80c
# ╠═fe35b082-73ad-11eb-12a6-fd11deff285c
# ╠═0f6a98be-73ae-11eb-373f-55016aaa1d93
# ╠═e8479082-73ae-11eb-177a-f17f4a58061c
# ╠═f1653e60-73ae-11eb-11c0-c31fe2b8e8e1
# ╠═e8435970-746c-11eb-06a7-15bcfb819dbe
# ╟─bfefa730-73ae-11eb-2563-7de28ca6f76f
# ╠═98707530-73af-11eb-1c46-a35fdf950234
# ╠═0586a2c0-73b0-11eb-2aef-c11ddf3ebebc
# ╟─f7ed3b50-73b0-11eb-0888-2bb790de4710
# ╠═0692ed32-73b1-11eb-3677-b564eaed4813
# ╠═10e0ddb0-73b1-11eb-160b-e3bd5bdee349
# ╠═ef0b3070-746c-11eb-2bc7-4359d817bd72
# ╟─364e2e50-746e-11eb-372a-43901f874018
# ╠═d6cce970-746e-11eb-0b84-9dcdd6dcdd1c
# ╟─f7bcc420-746e-11eb-2bc4-9fb87a66a9d6
# ╠═33cac250-746f-11eb-0a63-ef3072f331b0
# ╠═38caaa90-746f-11eb-0009-f13f4fe47bd2
# ╟─440481b0-746f-11eb-1331-ed0e633841db
# ╠═d07e0112-7470-11eb-2e7b-e798be8e8ce3
# ╠═69c09f90-7471-11eb-31ae-5548765d9003
# ╟─323b5970-7453-11eb-3d0c-253b24e71190
# ╠═a64b4370-7453-11eb-0f1b-5d54415d2cd0
# ╟─5fbee402-7455-11eb-1906-fd870a3b4b0c
# ╠═a4fd7bd0-7455-11eb-3304-3b4a44070ada
# ╠═ae2d0400-7455-11eb-1c03-2b55efdb2872
# ╠═ec00e000-7453-11eb-0974-b1beb705abf7
# ╠═7cc4a8b0-7454-11eb-0a41-459d5f3f8f46
# ╟─c08456c2-7456-11eb-248d-0542862bc3b0
# ╟─719ce450-84fa-11eb-1c45-09f6edfec173
# ╟─c958d890-7454-11eb-01ee-c7decfe0979a
# ╠═f4be4ffe-7454-11eb-0883-ed2b79023dee
# ╠═ca2262c0-7457-11eb-3efd-53375fed7523
# ╠═2087b960-7455-11eb-230d-cdc7a86d9a40
# ╠═3e8b2282-7455-11eb-33e0-957d838862c9
# ╠═3ef3e480-7457-11eb-0dd7-5d25e75ea6dd
# ╠═4b70c2f0-7457-11eb-29dd-a1b5d4768e29
# ╟─79340082-7457-11eb-0812-79a41e4a1ab6
# ╟─31e917d0-73b0-11eb-1211-e52f9c20617c
# ╠═3f0ffc70-73b1-11eb-33f9-2d6ad9a08a97
# ╠═34252fb0-73b1-11eb-23db-fba768f0e7c1
# ╠═575d9ad2-73b1-11eb-0439-e1ce04798ad5
# ╠═11d3acb0-73b2-11eb-1825-eba4787ad4bd
# ╠═c6df7130-73b1-11eb-000a-ad78ba8d9d5b
# ╠═eb6bd390-73b1-11eb-2deb-a5914ccc4d56
# ╠═30027f22-7f85-11eb-327c-7f1e3371042f
# ╠═35e27dd0-73b6-11eb-3df2-51f4574b5c19
# ╠═e6330b90-73b2-11eb-33e0-bd50688a4ed2
# ╠═70040360-73b8-11eb-0774-41dc546a68d1
# ╠═c8d39be0-73b8-11eb-3bfb-0d8b3584c4cf
# ╠═a5392580-73b6-11eb-283b-7dd02bff61c6
# ╟─2f5e20c2-746c-11eb-08c2-dbfe8afa0cec
# ╟─3dca0230-73a1-11eb-1142-fd054984ef0b
# ╠═38d93fb0-73a2-11eb-0752-a3bdfc8886d2
# ╟─3fa8dee0-73a2-11eb-339a-5b4fddc2f32e
# ╠═bea88cc0-73a4-11eb-13d2-d975fea0df63
# ╠═4ad034e0-73a1-11eb-37d0-ed0bf19b85e2
# ╠═4680d7f0-73a1-11eb-3527-23979106cd97
# ╠═6aa97a00-73a2-11eb-3a6a-4d6ac4343075
# ╠═975972d0-73a2-11eb-0288-81f5a09a6fd7
# ╠═08b95800-73a3-11eb-3f0c-e1842196e2f4
# ╠═3a1d14e0-73a3-11eb-1bf3-e7710c648e0c
# ╠═52a460e0-73a3-11eb-2f0c-39dccb5dd579
# ╟─57126960-73a3-11eb-17fb-9900ca71404d
# ╠═34cdb330-744a-11eb-2fbe-7bc8800b38ed
