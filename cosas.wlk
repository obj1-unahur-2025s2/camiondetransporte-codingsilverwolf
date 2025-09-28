object knightRider {
  method peso() = 500
  method peligrosidad() = 10    
}

object bumbleBee {
  var estaEnAuto = true
  method peso () = 800
  method transformarEnAuto(){
    estaEnAuto = true
  } 
  method transformarEnRobot() {
    estaEnAuto = false
  }
  method peligrosidad(){
    if (estaEnAuto) {
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
  var estaConMisiles = true
  method cargarMisiles(){
    estaConMisiles = true
  }
  method descargarMisiles(){
    estaConMisiles = false
  }

  method peso(){
    if (estaConMisiles) {
      return 300
    }
    else {
      return 200
    }
  }
  method peligrosidad(){
    if (estaConMisiles){
      return 300
    }
    else{
      return 0
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

