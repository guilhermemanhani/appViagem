//
//  ViagensAPI.swift
//  Decodable
//
//  Created by Guilherme Augusto da Rocha Manhani on 10/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import Foundation

class ViagemAPI {
    
    func getViagens() -> [[String: Any]]? {
        if let caminho = Bundle.main.url(forResource: "viagens", withExtension: "json") {
            let json: Data = try! Data(contentsOf: caminho)
            do {
                let viagens = try JSONSerialization.jsonObject(with: json, options: .allowFragments)
                let listaDeViagens = viagens as? [[String: Any]]
                return listaDeViagens
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
