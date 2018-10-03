class Formacion{
	
	var vagones = []
	var vagonesCarga= []
	var locomotoras = []
	
	
	
	method agregarVagonAFormacion(unaFormacion){
		
		vagones.add(unaFormacion)
	}
	
	method agregarLocomotoraAFormacion(unaLocomotora){
		locomotoras.add(unaLocomotora)
	}
	
	method agregarVagonesCargaAFormacion(unVagonCarga){
		vagonesCarga.add(unVagonCarga)
	}
	
	method enviarVagonesCargaADeposito(unDeposito){
		vagonesCarga.forEach{unVagon=>unDeposito.agregar(unVagon)} 
	}
	
	method enviarVagonesADeposito(unDeposito){
		vagones.forEach{unVagon=>unDeposito.agregar(unVagon)}
	}
	
	method totalPasajerosATransportar(){
	return	vagones.sum{vagon => vagon.cantidadPasajerosATransportar()}
	}
	
	method cuantosVagonesLivianosHay(){
		return vagones.count{vagon=>vagon.pesoMaximo()<2500}

	}
	
	method vagonMasPesado(){
		
	}
	
	method velocidadMaxima(){
		return locomotoras.min({unaLocomotora => unaLocomotora.velocidadMaxima()}).velocidadMaxima()
		   
	}
	
	method esEficiente(){
		return locomotoras.all{unaLocomotora => unaLocomotora.peso()*5 < unaLocomotora.pesoMaximoArrastre()}	
	}
	
	method puedeMoverse(){
	return	locomotoras.sum{unaLocomotora => unaLocomotora.arrastreUtil()} >=
		vagones.sum{unVagon => unVagon.pesoMaximo()}
	}
	
	method kilosEmpujeFaltantes(){
		if (self.puedeMoverse()){
			return 0
		}
		else {
			return (vagones.sum{unVagon => unVagon.pesoMaximo()} - locomotoras.sum{unaLocomotora => unaLocomotora.arrastreUtil()})
	}
}
}

class VagonPasajeros{
	
	var largo = 0
	var ancho = 0
	var cantidadPasajeros = 0
	
	method cantidadPasajerosATransportar(){
		if (ancho < 2.5){
			cantidadPasajeros = largo * 8
			return cantidadPasajeros
		}
		else {cantidadPasajeros = largo * 10}
		return cantidadPasajeros
		
	}
	
	method pesoMaximo(){
		
		return self.cantidadPasajerosATransportar() * 80
		
	}
		
}

class VagonCarga {
	var property cargaMaxima = 0 
	
	method pesoMaximo(){
		return self.cargaMaxima() + 160
		
	}
}

class Locomotora{
	
	var property peso = 200
	var property pesoMaximoArrastre = 120000
	var property velocidadMaxima = 80
	
	method arrastreUtil(){
	return	pesoMaximoArrastre - peso
	}
}

class Deposito{
	var coleccionDeposito = []
	var vagonesPesados =[]
	
	
	method agregar(unVagon){
		coleccionDeposito.add(unVagon)
	}
	
	method vagonesMasPesados(){
	 vagonesPesados.add(coleccionDeposito.max{unVagon => unVagon.pesoMaximo()})	
		return vagonesPesados
	}
	
	
}
