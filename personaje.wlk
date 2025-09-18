import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "mplayer.png"
	
	method sembrarMaiz(){
		self.validarEspacio(position)
		game.addVisual(new Maiz(position = self.position()))
	}
	method sembrarTrigo(){
		self.validarEspacio(position)
		game.addVisual(new Trigo(position = self.position()))
	}
	method sembrarTomaco(){
		self.validarEspacio(position)
		game.addVisual(new Tomaco(position = self.position()))
	}
	method validarEspacio(ubicacion){
		if( game.getObjectsIn(ubicacion).isEmpty()){
			self.error("no se puede cultivar aqui")
		}
	}
}