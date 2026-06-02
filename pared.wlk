class Pared {
	var property resistencia
	var property position 
	method image() = "paredLadrillos3.jpg"

    method recibirChoque() {
        resistencia -= 1
        if (resistencia <= 0) {
            game.removeVisual(self) // Desaparece del juego
        }
    }
}