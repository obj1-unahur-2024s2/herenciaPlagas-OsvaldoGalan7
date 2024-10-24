class Plaga{
  const poblacion

  method poblacion() = poblacion
  method esPoblacionContagiosa() = poblacion >= 10
  method danio() = poblacion * 2
}

class Cucaracha inherits Plaga{
  const peso

  method transmiteEnfermedades() = self.esPoblacionContagiosa() and self.promedioPeso() >= 10
  method promedioPeso() = poblacion/peso
  override method danio() = poblacion/2
  
}

class Pulga inherits Plaga{

   method transmiteEnfermedades() = self.esPoblacionContagiosa()
   
}

class Garrapata inherits Pulga{}

class Mosquito inherits Plaga{
  override method danio() = poblacion
  method transmiteEnfermedades() = self.esPoblacionContagiosa() and poblacion%3 == 0
}