//
//  RemoverRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 09/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class RemoverRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        let botaoRemove = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        alerta.addAction(botaoRemove)
        alerta.addAction(botaoCancelar)
        controller.present(alerta, animated: true, completion: nil)
    }
}
