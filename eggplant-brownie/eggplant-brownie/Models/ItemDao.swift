//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 09/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import Foundation

class ItemDao {
    func save(_ itens: [Item]) {
        
//        guard let caminho = recuperarDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperarDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do {
            guard let diretorio = recuperarDiretorio() else { return []}
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperarDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("itens")
           
        return caminho
    }
    
}
