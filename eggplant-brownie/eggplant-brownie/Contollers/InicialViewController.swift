//
//  ContentView.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 06/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

//import SwiftUI
//
//class InicialViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}

import UIKit

protocol adicionaRefeicaiDelegate{
    func add(_ refeicao: Refeicao)
}

class InicialViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate, AdicionarItensDelegate {
    
    var delegate: adicionaRefeicaiDelegate?
    
    var itens: [Item] = []
    
    var itensSelecionados: [Item] = []
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar",
            style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        print("test")
        recuperarItens()
    }
    
    func recuperarItens(){
        itens = ItemDao().recupera()
    }
           
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController,
            animated: true)
    }
    
    func add(_ item: Item){
        itens.append(item)
        ItemDao().save(itens)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar.")
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell (style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    
    func recuperarRefeicaoDoFormulario() -> Refeicao? {
         guard let nomeDaRefeicao = nomeTextField?.text else {
             return nil
         }
         
         guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
             return nil
         }
         
         let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
         refeicao.itens = itensSelecionados
        
        return refeicao
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(){
        
        if let refeicao = recuperarRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler o formulario")
        }
    }
}
