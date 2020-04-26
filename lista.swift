//
//  lista.swift
//  LISTA _ VERSION-4
//
//  Created by Gabriel Isaac González Arroyo on 25/04/20.
//  Copyright © 2020 Gabriel Isaac González Arroyo. All rights reserved.
//

import Foundation

class LISTA {
    
    init() {
        self.tam_lista  = 0
        self.apt_inicio = nil
        self.apt_final  = nil
    }
    
    /**
     Insertar NODO en lista primera vez ( UNICAMENTE SERÁ LLAMADA POR LA FUNCION INSERTAR NODO )
     */
    private func insertarNODOPrimeraVez ( numero : Int )->Void{
        
        let nuevo : NODO = NODO(numero: numero, en: 0)
        self.apt_inicio = nuevo
        self.apt_final  = nuevo
        self.tam_lista? += 1
    }
    
    /**
     Inserta NODO en alguna posicion
     */
    public func insertaNODO (numero : Int, en posicion : Int) -> Void{
        
        let nuevo_NODO : NODO = NODO(numero: numero, en: posicion)
        
        if posicion < 0 || posicion >= self.tam_lista! + 1 {
            print("[   POSICIÓN FUERA DE RANGO  ]\n")
        }else if self.apt_final == nil && self.apt_inicio == nil {
            self.insertarNODOPrimeraVez(numero: numero)
        }else if posicion == 0 {
            nuevo_NODO.anterior = nil //OK
            nuevo_NODO.siguiente = self.apt_inicio
            self.apt_inicio?.anterior = nuevo_NODO
            self.apt_inicio = nuevo_NODO
            self.tam_lista? += 1 // Incremento el contador de elementos.
        }else if posicion == self.tam_lista{
            nuevo_NODO.siguiente = nil //OK
            nuevo_NODO.anterior  = self.apt_final
            self.apt_final!.siguiente = nuevo_NODO
            self.apt_final = nuevo_NODO
            self.tam_lista? += 1
        }else if posicion > 0 && posicion < self.tam_lista! {
            let nodo_Aislado : NODO = self.obtenerNodo(en: posicion)
            if ( nodo_Aislado.siguiente == nil ){
                nuevo_NODO.siguiente = nodo_Aislado
                nuevo_NODO.anterior  = nodo_Aislado.anterior
                nodo_Aislado.anterior!.siguiente = nuevo_NODO
                nodo_Aislado.anterior = nuevo_NODO
                self.tam_lista? += 1
            }else{
                nuevo_NODO.siguiente = nodo_Aislado
                nuevo_NODO.anterior  = nodo_Aislado.anterior
                nodo_Aislado.anterior!.siguiente = nuevo_NODO
                nodo_Aislado.anterior? = nuevo_NODO
                self.tam_lista? += 1
            }
        }
    }
    
    /**
     Se elimina un nodo dentro de la lista
     */
    public func eliminaNodo ( en posicion : Int )->Void{
        
        if self.apt_final == nil && self.apt_inicio == nil {
            print("[   SIN ELEMENTOS EN LA LISTA   ]\n")
        }else if posicion < 0 || posicion > self.tam_lista! - 1 {
            print("[   NODO NO VÁLIDO EN LA LISTA   ]\n");
        }else if posicion == 0 && self.tam_lista! == 1 {
            self.apt_inicio = nil;
            self.apt_final  = nil;
            self.tam_lista? = 0;
        }else if ( posicion == 0  ){
            let nodo_aislado : NODO = obtenerNodo(en: posicion)
            nodo_aislado.siguiente!.anterior = nil
            self.apt_inicio = nodo_aislado.siguiente
            self.tam_lista? -= 1
        }else if ( posicion == self.tam_lista! - 1  ){
            var nodo_aislado : NODO = obtenerNodo(en: posicion)
            nodo_aislado = self.apt_final!
            nodo_aislado.anterior!.siguiente = nil;
            self.apt_final = nodo_aislado.anterior;
            self.tam_lista? -= 1;
        }else{ // Cualquier otro elemento
            let nodo_aislado : NODO = obtenerNodo(en: posicion)
            nodo_aislado.anterior!.siguiente? = nodo_aislado.siguiente!;
            nodo_aislado.siguiente!.anterior = nodo_aislado.anterior
            self.tam_lista? -= 1;
        }
    }
    
    /**
     Función que regresará un NODO en una posicion
     */
    
    private func obtenerNodo ( en posicion: Int )->NODO{
        
        var apt_auxiliar : NODO? = self.apt_inicio
        var pos : Int = 0
        
        while ( apt_auxiliar != nil && pos != posicion ) {
            apt_auxiliar = apt_auxiliar?.siguiente
            pos += 1
        }
        return apt_auxiliar!
    }
    
    /**
     Funcion que imprimirá la lista
     */
    public func imprimeLista () -> Void{
        
        if self.apt_inicio == nil && self.apt_final == nil {
            print("\n[   LA LISTA NO TIENE ELEMENTOS PARA IMPRIMIR   ]\n")
        }else{
            var apt_auxiliar : NODO? = self.apt_inicio
            var contador : Int = 0
            //print("[   ELEMENTOS EN LA LISTA   ]:")
            print("(  ",terminator:"")
            while apt_auxiliar != nil {
                print("[\(contador)]\(apt_auxiliar!.getNumero()!)",terminator:"  ")
                apt_auxiliar = apt_auxiliar!.siguiente
                contador += 1
            }
            print(")")
        }
    }
    
    /**
     Función que regresará el tamaño de la lista
     */
    public func getTamLista() -> Int{
        return self.tam_lista!
    }
    
    private var tam_lista  : Int?
    public var apt_inicio : NODO? //Se apunta al inicio de la lista
    public var apt_final  : NODO? //Se apunta al final  de la lista
}
