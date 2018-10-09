import Vagones.*
class Formacion{//es una clase abstracta, comparte 
//metodos en comun con las subclases pero no se deben instanciar. no funcionaria
	
	var vagones = []
	var locomotoras = []
	
	
	
	method agregarVagonAFormacion(unaFormacion){
		
		vagones.add(unaFormacion)
	}
	
	method agregarLocomotoraAFormacion(unaLocomotora){
		locomotoras.add(unaLocomotora)
	}
	
	
	method totalPasajerosATransportar(){
	return	vagones.sum{vagon => vagon.cantidadPasajerosATransportar()}
	}
	
	method cuantosVagonesLivianosHay(){
		return vagones.count{vagon=>vagon.pesoMaximo()<2500}

	}
	
	method pesoTotalVagones(){
	return	vagones.sum{unVagon=>unVagon.pesoMaximo()}
	}
	
	method vagonMasPesado(){
		return vagones.max{unVagon=>unVagon.pesoMaximo()}
		
	}
	
	method velocidadMaximaLocomotora(){
		return locomotoras.min({unaLocomotora => unaLocomotora.velocidadMaxima()}).velocidadMaxima()
		   
	}
	
	method velocidadMaxima(){
		
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
	method esCompleja(){
	return	(vagones.size()+locomotoras.size() > 20 ) or (self.pesoTotalVagones() + locomotoras.sum{unaLocomotora=>unaLocomotora.peso()}>10000)
	}
}

// esta clse hereda de otra, podemos definirles atributos nuevos y podemos definirle metodos nuevos.
// Tiene tambien todos los atributos y metodos de la superclase.
//. que pasa cuando le mando un mensaje al objeto:method lookup
//primero busca en la clase donde esta instaciado el objeto. Sino lo encuentra sigue para la superClase.
// 

class FormacionCortaDistancia inherits Formacion{
	method estaBienArmada()= self.puedeMoverse() and not self.esCompleja()
	override method velocidadMaxima(){ self.velocidadMaximaLocomotora().min(60)
	
		   
	}
	
	
}
class FormacionLargaDistancia inherits Formacion{

	
	method estaBienArmada() {
		return self.puedeMoverse() and self.tieneSufucientesBanios()
		 		 }	
	method tieneSufucientesBanios(){
		return self.cantidadDeBanios()>= self.totalPasajerosATransportar() / 50 
				}
				
	method cantidadDeBanios() { 
		return	vagones.sum{vagon => vagon.cantidadBanios()}
		}
	}

	
	
	
class Locomotora {
	
	var property peso = 1000
	var property pesoMaximoArrastre = 12000
	var property velocidadMaxima = 80
	
	method arrastreUtil(){
	return	pesoMaximoArrastre - peso
	}
}

