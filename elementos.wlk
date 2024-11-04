import plagas.*
class Hogar{
  var mugre
  const confort

  method esElementoBueno() = mugre <= (confort/2)
  method ataqueDe(plaga){
    mugre = mugre + plaga.danio()
    plaga.efecto()
  }
}

object huertas {
  var property nivel = 100 
}

class Huerta {
  var produccion

  method esElementoBueno() = produccion > huertas.nivel() 
  method ataqueDe(plaga){
    plaga.efecto()
    if(plaga.transmiteEnfermedades())
      {produccion = 0.max(produccion - ((plaga.danio()*0.1) + 10))}
    else
      {produccion = 0.max(produccion - (plaga.danio()*0.1))}
      
  }
}

class Mascota{
  var salud

  method esElementoBueno() = salud > 250
  method ataqueDe(plaga){
    if(plaga.transmiteEnfermedades())
      {salud = salud - plaga.danio()}
    plaga.efecto()
  }
}

class Barrio{
  const  elementos = []

  method elementos(cosas){elementos.addAll(cosas)}
  method esElementoBueno(unElemento) = unElemento.esElementoBueno()

  method esBarrioCopado(){
    const elementosMalos = elementos.count({e => !e.esElementoBueno()})
    const elementosBuenos = elementos.count({e => e.esElementoBueno()})

    return elementosBuenos > elementosMalos
  }
}



