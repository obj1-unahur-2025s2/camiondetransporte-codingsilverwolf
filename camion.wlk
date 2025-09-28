object camion {
  const cosasCargadas = []
  method cargar(cosa){
    cosasCargadas.add(cosa)
  }
  method peso(){
    return 1000 + cosasCargadas.map({c => c.peso()}).sum()
  }
  method contieneSoloPesosPares(){
    cosasCargadas.all({c => c.peso().even()})
  }
  method hayCosaDePeso(unPeso){
    cosasCargadas.any({c => c.peso() == unPeso})
  }
  method primerCosaDePeligrosidad(nivelDePeligrosidad){
    cosasCargadas.filter({c => c.peligrosidad()== nivelDePeligrosidad}).first()
  }
  method cosasConPeligrosidadMayorA(nivelDePeligrosidad){
    cosasCargadas.filter({c => c.peligrosidad()> nivelDePeligrosidad})
  }
  method cosasConPeligrosidadMayorACosa(unaCosa){
    cosasCargadas.filter({c => c.peligrosidad()> unaCosa.peligrosidad()})
  }
  method estaExcedidoDePeso(){
    return self.peso() > 2500
  }
  method puedeCircularEnRutaConPeligrosidad(unNivelDePeligrosidad){
    return not self.estaExcedidoDePeso() && cosasCargadas.all({c => c.peligrosidad() <= unNivelDePeligrosidad})
  }
}