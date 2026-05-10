import SwiftUI
import Combine
import Foundation

enum Rotas: Hashable {

    case categoria(String)
    case detalhe(Produto)
    case carrinho

}

class Roteador: ObservableObject {

    @Published var caminho = NavigationPath()

    func navegar(_ rota: Rotas) {
        caminho.append(rota)
    }

    func voltar() {
        caminho.removeLast()
    }

}
