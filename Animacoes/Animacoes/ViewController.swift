//
//  ViewController.swift
//  Animacoes
//
//  Created by Guilherme Augusto da Rocha Manhani on 22/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewAnimada: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func botaoIniciarAnimacao(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.viewAnimada.frame = CGRect(x: 285, y: self.viewAnimada.frame.origin.y, width: self.viewAnimada.frame.size.width, height: self.viewAnimada.frame.size.height)
        }
    }
}

