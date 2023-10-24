import socios.*

class Viaje {
	const idiomas = []
	
	
	method idiomas()=idiomas
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method cuantosDias()
	method esInteresante() = idiomas.size() > 1
	method esRecomendadaParaUnSocio(unSocio){
		return self.esInteresante() && unSocio.unaActividadLeAtrae() && !unSocio.actividadesRealizadas().contains(self) //duda
	}
}

class ViajeDePlaya inherits Viaje {
	const largo //Que se informe implica un getter?
	
	override method cuantosDias() = largo/500
	
	override method implicaEsfuerzo() {
		return largo > 1200
	}
	
	override method sirveParaBroncearse() = true
	
	
}

class ExcursionACiudad inherits Viaje {
	const atracciones 
	
	override method cuantosDias() = atracciones / 2
	
	override method implicaEsfuerzo() = atracciones.between(5,8)
	
	override method sirveParaBroncearse() = false
	
	override method esInteresante() = super() || atracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method cuantosDias() = super()+1
	
	override method sirveParaBroncearse() = !super()
}

class SalidaTrekking inherits Viaje {
	const kmDeSenderos
	const diasSolPorAnio
	
	override method cuantosDias() = kmDeSenderos / 50
	
	override method implicaEsfuerzo() = kmDeSenderos > 80
	
	override method sirveParaBroncearse() = diasSolPorAnio > 200 || (diasSolPorAnio.between(100,200) && kmDeSenderos > 120 )
	
	override method esInteresante() = super() && diasSolPorAnio > 140
}

class ClaseGimnasia inherits Viaje{
	
	override method cuantosDias() = 1
	
	override method implicaEsfuerzo() = true
	
	override method sirveParaBroncearse() = false
	
	override method esRecomendadaParaUnSocio(unSocio) = unSocio.edad().between(20,30)
}

