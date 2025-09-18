import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "mplayer.png"

	method sembrar(cultivo){
		self.validarEspacio(position)
		cultivo.sembrarEnPositionDeHector()
	}
	method validarEspacio(ubicacion){
		if(not game.getObjectsIn(ubicacion).isEmpty()){
			self.error("no se puede cultivar aqui")
		}
	}
}