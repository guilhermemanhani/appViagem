//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 09/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import Foundation

class RefeicaoDao {
    func save(_ refeicoes: [Refeicao]) {
        guard let caminho =  recuperarCaminho() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperarCaminho() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as?
                    Array<Refeicao> else{ return [] }
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperarCaminho() -> URL? {
           guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
           let caminho = diretorio.appendingPathComponent("refeicao")
           
           return caminho
    }
}
