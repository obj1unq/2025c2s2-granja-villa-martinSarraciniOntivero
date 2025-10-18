import wollok.game.*
import personaje.*
class Maiz {
	var property position = game.at(1,1)
	var property image = "corn_baby.png"
	var property maduracionPlanta = "no madura"
	method position() {
		return position
	}

	method crecer(){
		estadoMaiz.cambiarEstado()
		image = estadoMaiz.estado()
		maduracionPlanta = estadoMaiz.maduracion()
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
		self.madurar()	
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
	var property maduracionPlanta = "no madura" 
	method position() {

		return position
	}
	method image() {

		return image
	}
	method crecer(){
		estadoTrigo.cambiarEstado()
		image = estadoTrigo.estado()
		estadoTrigo.madurar()
		maduracionPlanta = estadoTrigo.maduracion()
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
		self.reinicioDeCiclo()
	}
	method reinicioDeCiclo(){
		if(estadoMaduracion == 4){
			image = "wheat_0.png"
			estadoMaduracion = 0
			maduracion = "no madura"
		}
	}
	method madurar(){
		 if(estadoMaduracion >= 2 ){
			maduracion = "madura"
		}
	}

}
class Tomaco{
	var property position = game.at(1,1)
	var property image =  "tomaco_baby.png"
	var property maduracionPlanta = "no madura"
	method position() {
		return position
	}
	method image() {
		return image
	}
	method crecer(){
		//self.validarCeldaArriba()
		estadoTomaco.cambiarEstado()
		image = estadoTomaco.estado()
		maduracionPlanta = estadoTomaco.maduracion()
	}
	/*method validarCeldaArriba(){
			//estadoTomaco.cambiarEstado()
			//image = estadoTomaco.estado()
		if(game.getObjectsIn(position.up(1)).isEmpty() and image == "tomaco_baby.png"){
			game.removeVisual(self)
			position = position.up(1)
			game.addVisual(self)
			estadoTomaco.cambiarEstado()
			estadoTomaco.madurar()
			image = estadoTomaco.estado()
		}else if(game.getObjectsIn(position.down(2)).isEmpty() and image == "tomaco_baby.png"){
			game.removeVisual(self)
			position = position.down(2)
			game.addVisual(self)
			estadoTomaco.cambiarEstado()
			estadoTomaco.madurar()
			image = estadoTomaco.estado()
			game.addVisual(self)
		}
	}
	
	method validarFondoAbajo(){
		if(game.getObjectsIn(position.at(position.x(),0))){
			self.error("hay una planta abajo")
		}

	}*/
}

object estadoTomaco{
	var property image = "tomaco_baby.png"
	var property maduracion = "no madura"
	method estado(){
		return image
	}
	method maduracion(){
		return maduracion
	}
	method madurar(){
		if(image == "tomaco.png"){
			maduracion = "madura"
		}
	}
	method cambiarEstado(){
		if(image == "tomaco_baby.png"){
			image = "tomaco.png"
			self.madurar()
		}
	}
}


