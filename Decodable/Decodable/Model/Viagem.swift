//
//  Viagem.swift
//  Decodable
//
//  Created by Guilherme Augusto da Rocha Manhani on 10/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import Foundation

class Viagem: NSObject, Decodable {
    
    enum CodingKeys: String, CodingKey{
        case id, titulo, quantidadeDeDias = "quantidade_de_dias", preco, localizacao
    }
    
    let id: Int
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let localizacao: String
    
    init(_ id: Int, _ titulo: String, _ quantidadeDeDias: Int, _ preco: String, _ localizacao: String) {
        self.id = id
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.localizacao = localizacao
    }
    
    class func converteListaParaData (_ json: [[String: Any]]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    class func decodificaViagem(_ jsonData: Data) -> [Viagem]? {
        do {
            return try JSONDecoder().decode([Viagem].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    // FORMA ANTIGA DE FAZER
//    convenience init(){
//        self.init(0, "", 0, "","")
//    }
//
//    func desserealiza(_ json: [[String: Any]]) -> [Viagem] {
//        var listaDeViagem: [Viagem] = []
//
//        for viagem in json {
//            guard let id = viagem["id"] as? Int else {
//                print("error ao converter id para Int")
//                return listaDeViagem
//            }
//
//            guard let titulo = viagem["titulo"] as? String else {
//                print("error ao converter titulo para String")
//                return listaDeViagem
//            }
//
//            guard let quantidadeDeDias = viagem["quantidade_de_dias"] as? Int else {
//                print("error ao converter quantidade de dias para Int")
//                return listaDeViagem
//            }
//
//            guard let preco = viagem["preco"] as? String else {
//                print("error ao converter preco para String")
//                return listaDeViagem
//            }
//
//            guard let localizacao = viagem["localizacao"] as? String else {
//                print("error ao converter localizacao para String")
//                return listaDeViagem
//            }
//
//            let novaViagem = Viagem(id, titulo, quantidadeDeDias, preco, localizacao)
//            listaDeViagem.append(novaViagem)
//        }
//
//        return listaDeViagem
//    }
}
