class Plaga{
  var poblacion

  method poblacion() = poblacion
  method esPoblacionContagiosa() = poblacion >= 10
  method danio() = poblacion * 2
  method efecto(){poblacion = poblacion + poblacion*0.1}
}

class Cucaracha inherits Plaga{
  var pesoPromedio

  method transmiteEnfermedades() = self.esPoblacionContagiosa() and pesoPromedio >= 10
  override method danio() = poblacion/2
  override method efecto(){
    poblacion = poblacion + poblacion*0.1
    pesoPromedio = pesoPromedio + 2
  } 
  
}

class Pulga inherits Plaga{

   method transmiteEnfermedades() = self.esPoblacionContagiosa()
   
}

class Garrapata inherits Pulga{
    override method efecto(){poblacion = poblacion + poblacion*0.2}
}

class Mosquito inherits Plaga{
  override method danio() = poblacion
  method transmiteEnfermedades() = self.esPoblacionContagiosa() and poblacion%3 == 0
}