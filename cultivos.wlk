import wollok.game.*
import personaje.*
class Maiz {
	var property position = game.at(1,1)
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
	method sembrarEnPositionDeHector(){
		position = personaje.position()
		game.addVisual(Maiz)
	}
}

class Trigo{

}

class Tomaco{

}