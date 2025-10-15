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
	var property image = "wheat_0.png" 
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return image
	}
	method crecer(){
		estadoTrigo.cambiarEstado()
		image = estadoTrigo.estado()
	}
}

object estadoTrigo{
	var property image = "wheat_0.png"
	method estado(){
		return image
	}
	method cambiarEstado(){
		return if(image == "wheat_0.png"){
			image = "wheat_1.png"
		}else if(image == "wheat_1.png"){
			image = "wheat_2.png"
		}else if(image == "wheat_2.png"){
			image = "wheat_3.png"
		}else{
			image = "wheat_0.png"
		}
	}
}
class Tomaco{
	var property position = game.at(1,1)
	var property image =  "tomaco_baby.png"
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return position
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return image
	}
		method crecer(){
		self.validarCeldaArriba()
		self.validarFondoAbajo()
		estadoTomaco.cambiarEstado()
		image = estadoTomaco.estado()
		position = position.y() +1
	}
	method validarCeldaArriba(){
		if(position.y() == 10){
			self.error("no puede subir")
		}
	}
	method validarFondoAbajo(){
		if(position.y().isEmpty()){
			self.error("no puede bajar")
		}
	}
}

object estadoTomaco{
	var property image = "tomaco_baby.png"
	method estado(){
		return image
	}
	method cambiarEstado(){
			image = "tomaco.png"
	}
}