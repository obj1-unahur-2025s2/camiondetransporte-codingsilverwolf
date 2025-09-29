object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method bultosQueOcupa() = 1
  method accionAlCargarEnCamion(){}    
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
  method bultosQueOcupa() = 2
  method accionAlCargarEnCamion(){
    self.transformarEnRobot()
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

  method bultosQueOcupa() {
    if (cantidad <= 100) {
      return 1
    }
    else if (cantidad <= 300){
    return 2   
    }
    else {
      return 3
    }
  }
  method accionAlCargarEnCamion(){
    cantidad+=12
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
  method bultosQueOcupa() = 1
  method accionAlCargarEnCamion(){
    peso -= 10
  } 
}

object  bateriaAntiAerea {
  var estaConMisiles = false
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
  method bultosQueOcupa(){
    if (estaConMisiles){
      return 2
    }
    else{
      return 1
    }
  }
  method accionAlCargarEnCamion(){
    self.cargarMisiles()
  }
}

object contenedorPortuario {
  const contenido = []
  method agregar(unaCosa){
    contenido.add(unaCosa)
  }
  method peso() = 100 + contenido.sum{o => o.peso()}
  method peligrosidad(){
    if (contenido.isEmpty()){
      return 0
    }
    else {
      return contenido.max({o => o.peligrosidad()}).peligrosidad()
      // comparar con 
      // contenido.map({o => o.peligrosidad()}).max()
    }
  }
  method bultosQueOcupa(){
    return 1 + contenido.sum({o => o.bultosQueOcupa()})
  }
  method accionAlCargarEnCamion(){
    contenido.forEach({o => o.accionAlCargarEnCamion()})
  }
}

object  residuosRadioactivos {
  var peso = 0
  method cantidad(unPeso){
    peso = unPeso
  }
  method peligrosidad() = 200
  method bultosQueOcupa() = 1
  method accionAlCargarEnCamion(){
    peso += 15
  }  
}

object  embalajeDeSeguridad {
  var contenido = paqueteDeLadrillos
  method envolver(unaCosa){
    contenido = unaCosa
  }
  method peso() {
    return contenido.peso()
    
  }
  method peligrosidad(){
    return contenido.peligrosidad()/2
  }
  method bultosQueOcupa() = 2
  method accionAlCargarEnCamion(){}
}


