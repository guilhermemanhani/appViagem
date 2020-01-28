//
//  PickerViewParcela.swift
//  Alura Ingressos
//
//  Created by Guilherme Augusto da Rocha Manhani on 28/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

protocol PickerViewNumeroDeParcela {
    func pickerViewParcelaSelecionada(parcela:String)
}

class PickerViewParcela: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var delegate:PickerViewNumeroDeParcela?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil {
            delegate?.pickerViewParcelaSelecionada(parcela: "\(row+1)")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)x"
    }
}
