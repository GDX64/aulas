### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 5ff2db90-8f4c-11eb-3d7e-851fa943cb4f
md"""
### RSA
encriptação

$c \equiv m^e \; (mod \; n)$

decriptação

$c^d \; \equiv m  \equiv m^{e*d}(mod \; n)$

ϕ(n) é chamado totient de Euler (sempre ele). Essa função calula quantos números menores que n não compartilham fatores com n.

$\phi(8)=4  = \{1, 3, 5, 7\}$
$\phi(n*q)=\phi(n)*\phi(q)$
Se n é um número primo.

$\phi(n)=n-1$

Segue

$m^{ϕ(n)} \equiv 1 \; (mod \; n)$
$a^k \equiv b^k (mod \; n)$
$ka \equiv kb (mod \; n)$
$m*m^{kϕ(n)} \equiv m \; (mod \; n)$
$m^{kϕ(n) + 1} \equiv m \; (mod \; n)$

assim: 

$m^{d*e}=m^{kϕ(n) + 1}$
$d=\frac{kϕ(n) + 1}{e}$

"""

# ╔═╡ 8357ef72-8f61-11eb-198e-63abc208e490
ϕ(p,q)=(p-1)*(q-1)

# ╔═╡ d3a60a20-8f4d-11eb-3252-e16d807092bc
isPrime(n)=reduce((acc, x)->n%x!==0 && acc, (2:n-1), init=true)

# ╔═╡ 66176650-8f4f-11eb-2754-d52548713c89
mapPair(n, f) = zip(n, f.(n))

# ╔═╡ 844a3950-8f4e-11eb-1327-93a057bacad0
primesList=mapPair(300:400, isPrime) |> x->[pair[1] for pair in x if pair[2]]

# ╔═╡ f364b070-8f50-11eb-385c-f95d7d8e5381
testPhi(m, n)=(BigInt(m)^(n-1))%n

# ╔═╡ 0b40a140-8f51-11eb-1add-f784e77150cd
testPhi(47,89)

# ╔═╡ d80cc930-8f59-11eb-2a63-35f2d211b97a
toInt(x) = Int(round(x))

# ╔═╡ 1ac65940-8f59-11eb-1ef5-a7e9e6b98a44
#Gerando os primos
(p, q) = rand(primesList,2)

# ╔═╡ 6adb03b0-8f61-11eb-1012-31ecc6a0f855
n=p*q

# ╔═╡ 7de23af0-8f61-11eb-3652-0f2a5d1035ea
#e precisa ser um número primo 
e=BigInt(71)

# ╔═╡ bcbe4d40-8f61-11eb-29d7-2db22538e4b2
#m é a mensagem que vai ser enviada, tem que ser menor que n
m=54

# ╔═╡ aca53540-8f61-11eb-1992-f73c09e9e37d
dCalc(k)=div(k*ϕ(p,q)*m+1,e)

# ╔═╡ f29a4930-8fcc-11eb-023e-898c918ce573
checkD(k)=(k*ϕ(p,q)*m+1)%e == 0

# ╔═╡ 7e289020-8fcc-11eb-1217-f3924cfb5500
intDCalc(k)=checkD(k) || k>1000 ? (dCalc(k), k) : intDCalc(k+1)

# ╔═╡ ae35fc80-8f63-11eb-1f59-61f87dc17993
#d é a chave privada
d, finalK = intDCalc(1)

# ╔═╡ 8ee918e0-8f62-11eb-0eef-87137120dab9
#c é a encriptação
c=mod((m^e), n)

# ╔═╡ a8b6c792-8f62-11eb-36b5-89d4541bf4a9
#Mensagem decriptada
mod(c^d, n)

# ╔═╡ Cell order:
# ╟─5ff2db90-8f4c-11eb-3d7e-851fa943cb4f
# ╠═8357ef72-8f61-11eb-198e-63abc208e490
# ╠═d3a60a20-8f4d-11eb-3252-e16d807092bc
# ╠═66176650-8f4f-11eb-2754-d52548713c89
# ╠═844a3950-8f4e-11eb-1327-93a057bacad0
# ╠═f364b070-8f50-11eb-385c-f95d7d8e5381
# ╠═0b40a140-8f51-11eb-1add-f784e77150cd
# ╠═d80cc930-8f59-11eb-2a63-35f2d211b97a
# ╠═1ac65940-8f59-11eb-1ef5-a7e9e6b98a44
# ╠═6adb03b0-8f61-11eb-1012-31ecc6a0f855
# ╠═7de23af0-8f61-11eb-3652-0f2a5d1035ea
# ╠═bcbe4d40-8f61-11eb-29d7-2db22538e4b2
# ╠═aca53540-8f61-11eb-1992-f73c09e9e37d
# ╠═f29a4930-8fcc-11eb-023e-898c918ce573
# ╠═7e289020-8fcc-11eb-1217-f3924cfb5500
# ╠═ae35fc80-8f63-11eb-1f59-61f87dc17993
# ╠═8ee918e0-8f62-11eb-0eef-87137120dab9
# ╠═a8b6c792-8f62-11eb-36b5-89d4541bf4a9
