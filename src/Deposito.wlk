import trenes.*

class Deposito{
	var coleccionDeposito = []
	var locomotoras = []
	
	method mostrarColeccionDeposito(){
		return coleccionDeposito
	}
	method agregarFormacion(unaFormacion){
		coleccionDeposito.add(unaFormacion)
	}
	

	method conjuntoVagonesPesados(){
		return coleccionDeposito.map{ unVagon => unVagon.vagonMasPesado() }
	
	}
	
	method necesitaConductorExperimentado(unaFormacion){
		return unaFormacion.esCompleja()
	}
	
	method agregarLocomotora(unaLocomotora){
		locomotoras.add(unaLocomotora)
		
	}
	
	method agregarLocomotoraParaMoverse(unaFormacion){
		if (unaFormacion.puedeMoverse()) {
		} else (coleccionDeposito.add(self.locomotoraAptaParaMoverFormacion(unaFormacion)))
	}
	
	method locomotoraAptaParaMoverFormacion(unaFormacion){
		return locomotoras.filter{unaLocomotora=>unaLocomotora.arrastreUtil()>= unaFormacion.kilosEmpujeFaltantes()}
	}
	
}
