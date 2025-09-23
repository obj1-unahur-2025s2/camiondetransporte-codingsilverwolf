object knightRider {
  method peso() = 500
  method peligrosidad() = 10    
}

object bumbleBee {
  method peso () = 800
  // voy a querer el getter para los test
  method estaEnAuto () = true
  method peligrosidad(){
    if (self.estaEnAuto()) {
      return 15
    }
    else {
      return 30
    }
  }
}

object paqueteDeLadrillos {
  var cantidad = 0
  method peso() = 2*cantidad
  method agregar(unaCantidad){
    cantidad = unaCantidad
  }
  method  peligrosidad() {
    return 1    
  }
}

object arenaAGranel {
  var peso = 0
  method peso () {
    return peso
  }
  method agregar(unaCantidad) {
    peso = unaCantidad
  }
  method peligrosidad(){
    return 2
  }
}

object  bateriaAntiAerea {
  method estaConMisiles(){
    return true
  }
  method peso(){
    if (self.estaConMisiles()) {
      return 300
    }
    else {
      return 200
    }
  }  
}

object contenedorPortuario {
  const contenido = []
  method peso() = 100 + contenido.sum{o => o.peso()}
  method peligrosidad(){
    if (contenido.isEmpty()){
      return 0
    }
    else {
      return contenido.map({o => o.peligrosidad()}).max() 
      // comparar con 
      // contenido.max({o => o.peligrosidad()}).peligrosidad()
    }
  }
  
}

object  residuosRadioactivos {
  var peso = 0
  method peso(){
    return peso
  }
  method peligrosidad() = 200
}

object  embalajeDeSeguridad {
  var contenido = null
  method peso() {
    return contenido.peso()
    
  }
  method peligrosidad(){
    return contenido.peligrosidad()/2
  }
  
}

