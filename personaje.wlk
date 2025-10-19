import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "mplayer.png"

	method sembrar(cultivo){
		self.validarEspacio()
		game.addVisual(cultivo)
	}
	method validarEspacio(){
		if( not game.colliders(self).isEmpty()){
			self.error("no se puede cultivar aqui")
		}
	}
	method regar(){
		self.validarSiHayPlanta()
		self.obtenerPlanta().crecer()
	}
	method validarSiHayPlanta(){
		if(game.colliders(self).isEmpty()){
			self.error("no hay planta aqui")
		}
	}
	method obtenerPlanta(){
		 return game.uniqueCollider(self)
		}
	method cosechar(){
		self.validarSiHayPlanta()
		self.obtenerCosecha()
	}
	method obtenerCosecha(){
		self.validarMaduracion(self.obtenerPlanta())
		cosecha.cosechar(self.obtenerPlanta())
		game.removeVisual(self.obtenerPlanta())
	}
	method validarMaduracion(planta){
		if(planta.maduracionPlanta() == "no madura"){
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
