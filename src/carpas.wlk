import personas.*
import jarras.*

class Carpa {
	var property limite 
	var property marcaVenta 
	var property tieneBanda //t-f
	var property genteDentro = [ ]
	
	method dejaIngresarA(persona) {
		return genteDentro.size() < limite
			and not persona.estaEbria()
	}
	method servir(capacidadDeJarra, persona) {
		if (genteDentro.contains(persona)) {
			persona.jarrasCompradas().add(new Jarra(marca=marcaVenta, capacidad=capacidadDeJarra))
		}
			else self.error("..no lo tengo a esx..")

	}
	method ebriosEmpedernidos() {
		return genteDentro.count({pers => pers.todasJarrasGrandes()})
	}
}
