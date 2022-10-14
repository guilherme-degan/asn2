#* Soma dois números
#* @get /soma
function(a, b) {
  as.numeric(a) + as.numeric(b)
}


#* Padrao
#* @get /
function() {
  "O Cloud Run já tá atualizado"
}

# httr::GET("http://naoseioq.gcp.io/soma", query = list(a = 5, b = 10))


#* Testa se env var ta funcionando
#* @get /testgetenv
function(a, b) {
  Sys.getenv("teste")
}

#* Porta padrao
#* @get /default_port
function() {
  Sys.getenv("PORT")
}

#* Testa se secrets ta funcionando
#* @get /nasa_api
function() {
  Sys.getenv("NASA_API")
}
