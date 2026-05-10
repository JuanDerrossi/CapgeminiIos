import SwiftUI
import Combine
import Foundation

@main
struct ShopMasterApp: App {

    @StateObject var roteador = Roteador()
    @StateObject var produtoVM = ProdutoViewModel()
    @StateObject var carrinhoVM = CarrinhoViewModel()

    var body: some Scene {

        WindowGroup {

            NavigationStack(path: $roteador.caminho) {

                HomeView()
                    .navigationDestination(for: Rotas.self) {
                        rota in construirTela(rota)
                    }

            }
            .environmentObject(roteador)
            .environmentObject(produtoVM)
            .environmentObject(carrinhoVM)

        }

    }

    @ViewBuilder
    func construirTela(_ rota: Rotas) -> some View {

        switch rota {

        case .categoria(let nome):
            CategoriaView(categoria: nome)

        case .detalhe(let produto):
            ProdutoDetalheView(produto: produto)

        case .carrinho:
            CarrinhoView()

        }

    }

}
