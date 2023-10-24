import viajes.*

class Socio {
	const actividades = []
	var maxActividades
	const property edad
	const idiomasQueHabla = []
	
	method adoradorDelSol() = actividades.all{act => act.sirveParaBroncearse()}
	
	method actividadesEsforzadas() = actividades.filter{act => act.implicaEsfuerzo()}
	
	method registrarActividad(unaActividad) {
		if (actividades.size() == maxActividades)
		self.error("Se llego al maximo de actividades")
		actividades.add(unaActividad)
	}
	
	method unaActividadLeAtrae(unaActividad)
	
	method actividadesRealizadas()=actividades
}

class SocioTranquilo inherits Socio{
	override method unaActividadLeAtrae(unaActividad)=unaActividad.cuantosDias() > 4
	
}

class SocioCoherente inherits Socio{
	override method unaActividadLeAtrae(unaActividad) {
		if(self.adoradorDelSol())
		return unaActividad.sirveParaBroncearse()
		else
		return unaActividad.implicaEsfuerzo()
		}
}

class SocioRelajado inherits Socio{
	override method unaActividadLeAtrae(unaActividad){
		return idiomasQueHabla.any{idioma => unaActividad.idiomas().contains(idioma)}
	}
}