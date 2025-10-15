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
	var property maduracion = 0
	method estado(){
		return image
	}
	method cambiarEstado(){
		maduracion += 1
		image = "wheat_"+maduracion+".png"
		self.reinicioDeCiclo()
	}
	method reinicioDeCiclo(){
		if(maduracion == 4){
			image = "wheat_0.png"
			maduracion = 0
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
		//self.error("no puede madurar")
	}
	method validarCeldaArriba(){
		if(not game.getObjectsIn(position.up(1)).isEmpty()){
			self.error("no se puede plantar, hay planta arriba")
		}
	}
	
	method validarFondoAbajo(){
		if(game.getObjectsIn(position.at(position.x(),0))){
			self.error("hay una planta abajo")
		}
/*
	method noPuedeMadurar(){
		if( position.y() == 10 and not position.y()+1.isEmpty() and not position.y(0).isEmpty()){
			self.error("no puede madurar el tomaco")
		}
	}*/
}
}
