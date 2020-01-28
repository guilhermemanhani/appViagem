//
//  LocalizacaoConsultaAPI.swift
//  Alura Ingressos
//
//  Created by Guilherme Augusto da Rocha Manhani on 27/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit
import Alamofire
//import AFNetworking

class LocalizacaoConsultaAPI: NSObject {
    
    func consultaViaCepAPI(cep:String, sucesso:@escaping(_ localizacao:Localizacao) -> Void, falha:@escaping(_ error:Error) -> Void) {

        AF.request("https://viacep.com.br/ws/\(cep)/json/", method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                if let resultado = response.value as? Dictionary<String, String> {
                    let localizacao = Localizacao(resultado)
                    sucesso(Localizacao(resultado))
                }
                break
            case .failure:
                falha(response.error!)
                break
            }
        }
    }
}
