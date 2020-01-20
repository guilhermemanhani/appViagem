//
//  Item.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 07/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
   
    
    let nome: String
    let calorias: Double
       
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
       
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
}
