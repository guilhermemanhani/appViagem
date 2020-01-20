//
//  ContentView.swift
//  Decodable
//
//  Created by Guilherme Augusto da Rocha Manhani on 10/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//import UIKit
//
//
//class ContentView: UIViewController{
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        getViagens()
//    }
//    
//    func getViagens(){
//        guard let listaDeViagens = ViagemAPI().getViagens() else { return }
//        print(listaDeViagens)
//    }
//}
