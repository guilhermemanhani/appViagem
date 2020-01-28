//
//  PickerViewAno.swift
//  Alura Ingressos
//
//  Created by Guilherme Augusto da Rocha Manhani on 28/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

protocol PickerViewAnoSelecionado {
    func anoSelecionado(ano:String)
}

class PickerViewAno: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var delegate:PickerViewAnoSelecionado?
    
    let listaDeAnos = ["2017", "2018", "2019", "2020", "2021", "2022"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaDeAnos.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let anoAtual = listaDeAnos[row]
        return anoAtual
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil {
            delegate?.anoSelecionado(ano: listaDeAnos[row])
        }
    }
}
