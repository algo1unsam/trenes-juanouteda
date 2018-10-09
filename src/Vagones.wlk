import trenes.*
import Deposito.*

class VagonPasajeros{
	
	var largo = 0
	var ancho = 0
	var cantidadPasajeros = 0
	const property cantidadDeBanios = 1
	
	
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
	method cantidadDeBanios(){
		return 0
	}
}

