//
//  ViewController.swift
//  Alura Ingressos
//
//  Created by Guilherme Augusto da Rocha Manhani on 24/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit
import Money

class ViewController: UIViewController, PickerViewMesSelecionado, PickerViewAnoSelecionado, PickerViewNumeroDeParcela{
    
    @IBOutlet weak var imagemBanner: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    @IBOutlet weak var labelValorDasParcelas: UILabel!
   
    var pickerViewMes = PickerViewMes()
    var pickerViewAno = PickerViewAno()
    var pickerViewParcela = PickerViewParcela()
    
    var valorDoIngresso:BRL = 199.00
    
    @IBAction func textFieldCepAlterouValor(_ sender: UITextField) {
        guard let cep = sender.text else { return }
        LocalizacaoConsultaAPI().consultaViaCepAPI(cep: cep, sucesso: { (localizacao) in
            self.buscaTextField(tipoDeTextField: .endereco, completion: { (textFieldEndereco) in textFieldEndereco.text = localizacao.logradouro
            })
            self.buscaTextField(tipoDeTextField: .bairro, completion: { (textFieldBairro) in textFieldBairro.text = localizacao.bairro
            })
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func botaoComprar(_ sender: UIButton) {
        let textFieldsEstaoValidos = validaFormulario().verificaTextFieldsValidos(listaDeTextFields: textFields)
        let textFieldsEstaoPreenchidos =  validaFormulario().verificaTextFieldsPreenchidos(textFields: textFields)
        
        if textFieldsEstaoPreenchidos && textFieldsEstaoValidos {
            let alerta = validaFormulario().exibeNotificacao(titulo: "Parabéns", mensagem: "compra realizada com sucesso")
            present(alerta, animated: true, completion: nil)
        } else {
            let alerta = validaFormulario().exibeNotificacao(titulo: "Atenção", mensagem: "preencha corretamente todos os campos")
            present(alerta, animated: true, completion: nil)
        }
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagemBanner.layer.cornerRadius = 10
        self.imagemBanner.layer.masksToBounds = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        pickerViewMes.delegate = self
        pickerViewAno.delegate = self
        pickerViewParcela.delegate = self
        
//        let cpf = "089.756.339-50"
//        if BooleanValidator().validate(cpf: cpf) {
//            print("valido")
//        } else {
//            print("invalido")
//        }
    }
    
    @objc func aumentarScrollView(notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: 1350)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func buscaTextField(tipoDeTextField:TiposDeTextField, completion:(_ textFieldSolicitado:UITextField) -> Void){
        for textField in textFields {
            if let textFieldAtual = TiposDeTextField(rawValue: textField.tag){
                if textFieldAtual == tipoDeTextField {
                    completion(textField)
                }
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func textFieldMesEntrouEmFoco(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewMes
        pickerView.dataSource = pickerViewMes
        sender.inputView = pickerView
    }
    
    func mesSelecionado(mes: String) {
        self.buscaTextField(tipoDeTextField: .mesDoVencimento) { (textFieldMes) in
            textFieldMes.text = mes
        }
    }
    
    func anoSelecionado(ano: String) {
        self.buscaTextField(tipoDeTextField: .anoDoVencimento) { (textFieldAno) in
            textFieldAno.text = ano
        }
    }
    
    
    @IBAction func textFieldAnoEntrouEmFoco(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewAno
        pickerView.dataSource = pickerViewAno
        sender.inputView = pickerView
    }
    
    
    @IBAction func textFieldCodigoDeSeguranca(_ sender: UITextField) {
        guard let texto = sender.text else { return }

        if texto.count > 3 {
            let codigo = texto.suffix(3)
            self.buscaTextField(tipoDeTextField: .codigoDeSeguranca, completion: { (textFieldCodigoSeguranca) in
                textFieldCodigoSeguranca.text = String(codigo)
            })
        }
        else {
            self.buscaTextField(tipoDeTextField: .codigoDeSeguranca, completion: { (textFieldCodigoSeguranca) in
                textFieldCodigoSeguranca.text = texto
            })
        }
    }
    
    func pickerViewParcelaSelecionada(parcela: String) {
        self.buscaTextField(tipoDeTextField: .parcela) { (textFieldParcela) in
            textFieldParcela.text = "\(parcela)x"
            let calculoDaParcela = "\(valorDoIngresso/Int(parcela)!)"
            self.labelValorDasParcelas.text = String(format: "%@x %@ (ou R$199,00 à vista)", parcela, calculoDaParcela)
        }
    }
//
//    func decimal(with string: String) -> NSDecimalNumber {
//        return formatter.number(from: string) as? NSDecimalNumber ?? 0
//    }
    
    @IBAction func textFieldParcelas(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewParcela
        pickerView.dataSource = pickerViewParcela
        sender.inputView = pickerView
    }
}

