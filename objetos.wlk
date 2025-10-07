/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property camisetaTitular = true  
	
	method image() {
		if(camisetaTitular) {
			return "lionel-titular.png"
		} else {
			return "lionel-suplente.png"
		}
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method levantarla(){
		self.validarLevantarla()
		pelota.position().y(position.y() + 1)
		game.schedule(2000, { => pelota.position().y(position.y()) })
	}

	method validarLevantarla(){
		if( not (game.uniqueCollider(pelota) == self)){
			self.error("Lionel no esta sobre la pelota")
		}
	}
	

	method cambiarCamiseta() {
		self.validarBorde()
		camisetaTitular = !camisetaTitular
			  
	}
	
	method validarBorde() {
		if(not (position.x() == 0)) {
			self.error("Lionel no esta en el borde izquierdo")
		}
	  
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

}
