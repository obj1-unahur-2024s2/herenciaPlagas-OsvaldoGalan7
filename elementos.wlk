import plagas.*
class Hogar{
  var mugre
  const confort

  method esElementoBueno() = mugre <= (confort/2)
  method ataqueDe(plaga){mugre = mugre + plaga.danio()}
}

class Huertas {
  var property nivel = 100 
}

class Huerta inherits Huertas{
  var produccion

  method esElementoBueno() = produccion > nivel 
  method ataqueDe(plaga){
    if(plaga.transmiteEnfermedades())
      produccion = 0.max(produccion - ((plaga.danio()*0.1) + 10))
    else
      produccion = 0.max(produccion - (plaga.danio()*0.1))
  }
}

class Mascota{
  var salud

  method esElementoBueno() = salud > 250
  method ataqueDe(plaga){
    if(plaga.transmiteEnfermedades())
      salud = salud - plaga.danio()
  }
}

class Barrio{
  const elementos = []

  method esElementoBueno(unElemento) = unElemento.esElementoBueno()

  method esBarrioCopado(){
    const elementosMalos = elementos.count({e => !e.esElementoBueno()})
    const elementosBuenos = elementos.count({e => e.esElementoBueno()})

    return elementosBuenos > elementosMalos
  }
}



