import SwiftUI
import Combine

class CarrinhoViewModel: ObservableObject {

    @Published var itens: [ItemCarrinho] = []

    // Adicionar produto
    func adicionar(produto: Produto) {

        if let indice = itens.firstIndex(where: {
            $0.produto.id == produto.id
        }) {

            itens[indice].quantidade += 1

        } else {

            let item = ItemCarrinho(
                produto: produto,
                quantidade: 1
            )

            itens.append(item)
        }
    }

    // Remover produto
    func remover(item: ItemCarrinho) {
        itens.removeAll {
            $0.id == item.id
        }
    }

    // Valor total
    var total: Double {

        itens.reduce(0) {
            $0 + ($1.produto.preco * Double($1.quantidade))
        }

    }

}
