import wollok.game.*
import personaje.*
class Maiz {
	var property position = game.at(1,1)
	var property image = "corn_baby.png"
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}

	method crecer(){
		estadoMaiz.cambiarEstado()
		image = estadoMaiz.estado()
	}
}
object estadoMaiz{
	var property image = "corn_baby.png"
	method estado(){
		return image
	}
	method cambiarEstado(){
		image = "corn_adult.png"		
	}
}
class Trigo{
	var property position = game.at(1,1)
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
}

class Tomaco{
	var property position = game.at(1,1)
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco_baby.png"
	}
}