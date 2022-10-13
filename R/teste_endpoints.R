library(httr)

resposta_api <- GET("https://ans2-ve3htxqhbq-uc.a.run.app/")
content(resposta_api)

dados = list(
  a = 2,
  b = 11
)

resposta_api <- GET("https://ans2-ve3htxqhbq-uc.a.run.app/soma", query = dados)
valor <- content(resposta_api)[[1]]

