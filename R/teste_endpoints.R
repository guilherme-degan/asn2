library(httr)

resposta_api <- GET("http://127.0.0.1:1234/")
content(resposta_api)

dados = list(
  a = 2,
  b = 10
)

requests.get("http://127.0.0.1:1234/soma", query = dados)
resposta_api <- GET("http://127.0.0.1:1234/soma", query = dados)
valor <- content(resposta_api)[[1]]



if(valor < 10) 4 else 5
