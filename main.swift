//
//  main.swift
//  LISTA _ VERSION-4
//
//  Created by Gabriel Isaac González Arroyo on 25/04/20.
//  Copyright © 2020 Gabriel Isaac González Arroyo. All rights reserved.
//

import Foundation



var lista : LISTA = LISTA()

for i in 0...15{
    lista.insertaNODO(numero: i, en: i)
    lista.imprimeLista()
}

for i in stride(from: 15, to: 0, by: -1){
    lista.eliminaNodo(en: i)
    lista.imprimeLista()
}
