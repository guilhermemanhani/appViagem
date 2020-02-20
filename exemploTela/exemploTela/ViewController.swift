//
//  ViewController.swift
//  exemploTela
//
//  Created by Guilherme Augusto da Rocha Manhani on 30/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var containerViewProfile: NSLayoutConstraint!
    @IBOutlet weak var containerInfo: NSLayoutConstraint!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var botaoEditar: UIButton!
    
    func calcularContainers() {
        let widthTela = viewPrincipal.layer.bounds.width
        let viewProfile = widthTela / 1.5
        let viewInfo = widthTela * 1.3
        containerViewProfile.constant = viewProfile
        containerInfo.constant = viewInfo
        botaoEditar.layer.cornerRadius = 5
        botaoEditar.layer.borderWidth = 2
        botaoEditar.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcularContainers()
        viewInfo.layer.cornerRadius = 40
        viewInfo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

}

