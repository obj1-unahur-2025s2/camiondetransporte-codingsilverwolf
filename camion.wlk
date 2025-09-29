object camion {
  const cosasCargadas = []
  method cargar(cosa){
    cosasCargadas.add(cosa)
  }
  method peso(){
    return 1000 + cosasCargadas.map({c => c.peso()}).sum()
  }
  method contieneSoloPesosPares(){
    return cosasCargadas.all({c => c.peso().even()})
  }
  method hayCosaDePeso(unPeso){
    return cosasCargadas.any({c => c.peso() == unPeso})
  }
  method primerCosaDePeligrosidad(nivelDePeligrosidad){
    return cosasCargadas.filter({c => c.peligrosidad()== nivelDePeligrosidad}).first()
  }
  method cosasConPeligrosidadMayorA(nivelDePeligrosidad){
    return cosasCargadas.filter({c => c.peligrosidad()> nivelDePeligrosidad})
  }
  method cosasConPeligrosidadMayorACosa(unaCosa){
    return cosasCargadas.filter({c => c.peligrosidad()> unaCosa.peligrosidad()})
  }
  method estaExcedidoDePeso(){
    return self.peso() > 2500
  }
  method puedeCircularEnRutaConPeligrosidad(unNivelDePeligrosidad){
    return not self.estaExcedidoDePeso() && cosasCargadas.all({c => c.peligrosidad() <= unNivelDePeligrosidad})
  }
  method bultosCargados(){
    return cosasCargadas.sum({c => c.bultosQueOcupa()})
  }
  method descargar(cosa){
    cosasCargadas.remove(cosa)
  }
}