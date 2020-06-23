import carpas.*

class Persona {
	var property peso = 0
	var property jarrasCompradas = [ ]
	var property musicaTradicional = true
	var property aguante = 0
	

	method leGusta(cerveza) {
		return true
	}
	method totalAlcohol() {
		return jarrasCompradas.sum({jar => jar.contenidoAlcohol()})
	}
	method estaEbria() {
		return (self.totalAlcohol() * peso) > aguante
	}
	method quiereEntrar(carpa) {
		return self.leGusta(carpa.marcaVenta())
			and musicaTradicional == carpa.tieneBanda()
	}
	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa)
			and carpa.dejaIngresarA(self)
	}
	method entra(carpa) {
		if (self.puedeEntrar(carpa)) {
			carpa.genteDentro().add(self)
		}
			else self.error("..al cabo que ni queria..")
	}
	method todasJarrasGrandes() {
		return jarrasCompradas.all({jar => jar.capacidad() >= 1})
	}
	method esPatriota() {
		return jarrasCompradas.all({jar => jar.marca().pais() == self.nacionalidad()})
	}


}

class Belga inherits Persona {
	const property nacionalidad = "belga"
	override method leGusta(cerveza) {
		return cerveza.lupulo() > 4
	}
}

class Checo inherits Persona {
	const property nacionalidad = "checa"
	override method leGusta(cerveza) {
		return cerveza.lupulo() > 8
	}
}

class Aleman inherits Persona {
	const property nacionalidad = "alemana"
	override method quiereEntrar(carpa) {
		return super(carpa) 
			and carpa.genteDentro().size().even()
	}
}