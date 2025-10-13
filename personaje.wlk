import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "mplayer.png"

	method sembrar(cultivo){
		self.validarEspacio(position)
		game.addVisual(cultivo)
	}
	method validarEspacio(ubicacion){
		if( game.getObjectsIn(ubicacion).isEmpty()){
			self.error("no se puede cultivar aqui")
		}
	}
	method regar(){
		self.validarSiHayPlanta(position)
		self.obtenerPlanta().crecer()
	}
	method validarSiHayPlanta(posicion){
		if(game.getObjectsIn(posicion).isEmpty()){
			self.error("no hayplanta aqui")
		}
	}
	method obtenerPlanta(){
		 return game.uniqueCollider(self)
		}
	method cosechar(){
		self.validarSiHayPlanta(position)
		self.obtenerCosecha()
	}
	method obtenerCosecha(){
		self.validarMaduracion(self.obtenerPlanta())
		cosecha.cosechar(self.obtenerPlanta())
		game.removeVisual(self.obtenerPlanta())
	}
	method validarMaduracion(planta){
		if(planta.maduracion() == "no madura"){
			self.error("no se puede cosechar ")
		}
	}
}

object cosecha{
	const property cosechadas = #{}
	method cosechar(planta){
		cosechadas.add(planta)

	}
}
