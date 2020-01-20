//
//  ViewContoller.swift
//  Decodable
//
//  Created by Guilherme Augusto da Rocha Manhani on 10/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//


import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getViagens()
    }
    
    func getViagens() {
        guard let json = ViagemAPI().getViagens() else { return }
        guard let jsonData =  Viagem.converteListaParaData(json) else { return }
        guard let listaDeViagem = Viagem.decodificaViagem(jsonData) else { return }
        for viagem in listaDeViagem {
            print(viagem.titulo)
        }
    }
}
