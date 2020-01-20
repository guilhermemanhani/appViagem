import UIKit

class Refeicao {
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}

//let refeicao = Refeicao()

class Item{
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}


let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijao", calorias: 14.0)

let refeicao = Refeicao(nome: "Almoço", felicidade: "5")

refeicao.itens.append(arroz)
refeicao.itens.append(feijao)

print(refeicao.nome)
//if let primeiroItemDaLista = refeicao.itens.first{
//    print(primeiroItemDaLista.nome)
//}
//print(refeicao.totalDeCalorias())

