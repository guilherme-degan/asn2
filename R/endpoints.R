#* Soma dois números
#* @get /soma
function(a, b) {
  a + b
}


#* Padrao
#* @get /
function() {
  "O Cloud Run já tá atualizado"
}

# httr::GET("http://naoseioq.gcp.io/soma", query = list(a = 5, b = 10))


#* Soma dois números
#* @get /testgetenv
function(a, b) {
  Sys.getenv("TESTE_ENV")
}
