class Pedido {
  //Sin inicializar ninguno porque deben especificarse al instanciar
  const distanciaARecorrer
  var tiempoMaximo
  //Property porque necesito estos métodos de consulta
  const property cantidadDePasajeros
  const property coloresIncompatibles

  method velocidadRequerida() = distanciaARecorrer / tiempoMaximo
  method puedeSerSatisfechoConAuto(auto) {
    //Uso return acá por una cuestión de prolijidad y legibilidad
    return (
      auto.velocidadMaxima() >= self.velocidadRequerida() + 10 and
      auto.capacidad() >= cantidadDePasajeros and
      !coloresIncompatibles.contains(auto.color())
    )
  }

  method acelerar() { tiempoMaximo -= 1 }
  method relajar() { tiempoMaximo += 1 }
  
}