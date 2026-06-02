class Dependencia {
	const cantidadDeEmpleados
	const flotaDeRodados = []
	const pedidos = []

	method agregarRodado(rodado) { flotaDeRodados.add(rodado) }
	method agregarRodados(listaDeRodados) { flotaDeRodados.addAll(listaDeRodados) } //No lo especifica el enunciado, pero para agilizar
	method quitarRodado(rodado) { flotaDeRodados.remove(rodado) }
	method quitarRodados(listaDePedidos) { flotaDeRodados.removeAll(listaDePedidos) } //No lo especifica el enunciado, pero para agilizar
	
	method pesoTotal() = flotaDeRodados.sum({ r => r.peso() })
	method estaBienEquipada() = flotaDeRodados.size() >= 3 and self.todosLosRodadosPuedenIrAAlmenos(100)
	method todosLosRodadosPuedenIrAAlmenos(velocidad) = flotaDeRodados.all({ r => r.velocidadMaxima() >= velocidad })
	method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({ r => r.capacidad() })
	method rodadosDeColor(color) = flotaDeRodados.filter({ r => r.color() == color })
	method colorDelRodadoMasRapido() = flotaDeRodados.max({ r => r.velocidadMaxima() }).color()
	method capacidadFaltante() = cantidadDeEmpleados - self.capacidadTotalDeFlota()
	method capacidadTotalDeFlota() = flotaDeRodados.sum({ r => r.capacidad() })
	method esGrande() = cantidadDeEmpleados >= 40 and flotaDeRodados.size() >= 5

	//Para pedidos
	method agregarPedido(pedido) { pedidos.add(pedido) }
	method agregarPedidos(listaDePedidos) { pedidos.addAll(listaDePedidos) } //No lo especifica el enunciado, pero para agilizar
	method quitarPedido(pedido) { pedidos.remove(pedido) }
	method quitarPedidos(listaDePedidos) { pedidos.removeAll(listaDePedidos) } //No lo especifica el enunciado, pero para agilizar

	method totalDePasajerosEnPedidos() = pedidos.sum({ p => p.cantidadDePasajeros() })
	method pedidosQueNoPuedenSerSatisfechos() = pedidos.filter({ pedido => self.ningunAutoPuedeSatisfacer(pedido) })
	method ningunAutoPuedeSatisfacer(pedido) = flotaDeRodados.all({ rodado => !pedido.puedeSerSatisfechoConAuto(rodado) })
	method todosLosPedidosTienenIncompatible(color) = pedidos.all({ p => p.coloresIncompatibles().contains(color) })
	
	method relajarTodosLosPedidos() { pedidos.forEach({ p => p.relajar() }) }
}