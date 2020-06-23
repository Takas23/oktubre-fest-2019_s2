class Cerveza {
	var property lupulo 
	var property pais //nacionalidad ("alemana", "belga", "checa", etc)
	
}

class Rubia inherits Cerveza {
	var property graduacion
	
}

class Negra inherits Cerveza {
//revisar
	method graduacion() {
		return graduacionReglamentaria.graduacionR().min(lupulo * 2) 
	}
}

class Roja inherits Negra {
	override method graduacion() {
		return super() * 1.25
	}
}

object graduacionReglamentaria {
	var property graduacionR 
}

