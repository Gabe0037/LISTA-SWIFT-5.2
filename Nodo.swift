//
//  Nodo.swift
//  LISTA _ VERSION-4
//
//  Created by Gabriel Isaac González Arroyo on 25/04/20.
//  Copyright © 2020 Gabriel Isaac González Arroyo. All rights reserved.
//

import Foundation

class NODO {

    init(numero : Int, en posicion : Int) {
        self.numero = numero;
        self.pos_en_lista  = posicion
        self.apt_siguiente = nil
        self.apt_anterior  = nil
    }
    
    /**
     Se obtiene el siguiente NODO
     */
    var siguiente: NODO? {                 //Se usa ? por si no hay referencia a siguiente
        get {
            self.apt_siguiente
        }
        set {
            self.apt_siguiente = newValue
        }
    }
    
    /**
     Se obtiene el anterior NODO
     */
    var anterior: NODO? {                  //Se usa ? por si no hay referencia a siguiente
        get {
            self.apt_anterior
        }
        set {
            self.apt_anterior = newValue
        }
    }
    
    /**
     Se obtiene el número guardado en el nodo
     */
    func getNumero() -> Int? {
        return self.numero
    }
    
    /**
     Se obtiene la posicion del nodo en la lista.
     */
    func getPosicion() -> Int? {
        return self.pos_en_lista
    }
    
    private var numero : Int?
    private var pos_en_lista  : Int?
    private var apt_siguiente : NODO?
    private var apt_anterior  : NODO?
}
