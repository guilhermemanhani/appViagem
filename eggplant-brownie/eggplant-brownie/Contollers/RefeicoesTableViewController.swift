//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme Augusto da Rocha Manhani on 07/01/20.
//  Copyright © 2020 Guilherme Augusto da Rocha Manhani. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, adicionaRefeicaiDelegate{
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDao().recupera()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    @IBAction func navegar(_ sender: Any) {
          self.performSegue(withIdentifier: "formSegue", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MostrarDetalhes(_ :)))
        celula.addGestureRecognizer(longPress )
        
        return celula
    }
    
    @objc func MostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else{return}
            let refeicao = refeicoes[indexPath.row]
            
            RemoverRefeicaoViewController(controller: self).exibe(refeicao, handler: { alert in self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    func removeRefeicao(alerta: UIAlertAction){
        print("remove")
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDao().save(refeicoes)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "formSegue"{
            if let viewController = segue.destination as? InicialViewController{
                viewController.delegate = self
            }
        }
    }
}
