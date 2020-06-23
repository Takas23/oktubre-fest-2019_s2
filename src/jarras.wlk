class Jarra {
	var property capacidad
	var property marca
	
	method contenidoAlcohol() {
		return capacidad * marca.graduacion()
	}
}
