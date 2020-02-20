//
//  ViewController.swift
//  Auto Layout
//
//  Created by Guilherme Augusto da Rocha Manhani on 20/02/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let redView = UIView()
        redView.backgroundColor = .red
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
        view.addSubview(redView)
        redView.centralizarSuperview(size: .init(width: 200, height: 200))
//        redView.centralizarSuperview(size: .init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat))
//        redView.preencherSuperview(padding: .init(top: 50, left: 50, bottom: 50, right: 50))
        
        
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
//        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
//        redView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        redView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
//        let horizontalStackView = UIStackView(arrangedSubviews: [redView, blueView])
//        horizontalStackView.distribution = .fillEqually
//
//        let stackView: UIStackView = UIStackView(arrangedSubviews: [horizontalStackView, yellowView])
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//
//        view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }


}

