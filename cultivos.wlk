import wollok.game.*
import personaje.*
class Maiz {
	var property position = game.at(1,1)
	var property image = "corn_baby.png"
	var property maduracionPlanta = estadoMaiz.maduracion()
	method position() {

		return position
	}

	method crecer(){
		estadoMaiz.cambiarEstado()
		image = estadoMaiz.estado()
		estadoMaiz.madurar()
	}

}
object estadoMaiz{
	var property image = "corn_baby.png"
	var property maduracion = "no madura"
	method estado(){
		return image
	}
	method cambiarEstado(){
		image = "corn_adult.png"		
	}
	method madurar(){
		 if(image == "corn_adult.png"){
			maduracion = "madura"
		}
	}
}
class Trigo{
	var property position = game.at(1,1)
	var property image = "wheat_0.png" 
	var property maduracionPlanta = estadoTrigo.maduracion() 
	method position() {

		return position
	}
	method image() {

		return image
	}
	method crecer(){
		estadoTrigo.cambiarEstado()
		image = estadoTrigo.estado()
	}
}

object estadoTrigo{
	var property image = "wheat_0.png"
	var property maduracion = "no madura"
	var property estadoMaduracion = 0
	method estado(){
		return image
	}
	method cambiarEstado(){
		estadoMaduracion += 1
		image = "wheat_"+estadoMaduracion+".png"
		self.cambiarAMadura()
		self.reinicioDeCiclo()
	}
	method reinicioDeCiclo(){
		if(estadoMaduracion == 4){
			image = "wheat_0.png"
			estadoMaduracion = 0
			maduracion = "no madura"
		}
	}
	method cambiarAMadura(){
		 if(estadoMaduracion >= 2 ){
			maduracion = "madura"
		}
	}

}
class Tomaco{
	var property position = game.at(1,1)
	var property image =  "tomaco_baby.png"
	method position() {
	
		return position
	}
	method image() {
	
		return image
	}
	method crecer(){
		self.validarCeldaArriba()
		self.validarFondoAbajo()
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

	}
}

object estadoTomaco{
	
}


