//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 08/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

protocol AdicionarItensDelegate {
    func add(_ item:  Item)
}

class AdicionarItensViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    var delegate: AdicionarItensDelegate?
    
    init(delegate: AdicionarItensDelegate){
        super.init(nibName: "AdicionarItensViewController",  bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func adicionarItem(_ sender: Any){
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        if let numeroDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
        
    }
}
