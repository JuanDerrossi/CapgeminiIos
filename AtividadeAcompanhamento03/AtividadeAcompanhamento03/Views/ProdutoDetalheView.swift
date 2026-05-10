import SwiftUI
import Combine

struct ProdutoDetalheView: View {

    @EnvironmentObject var carrinhoVM: CarrinhoViewModel

    let produto: Produto

    var body: some View {

        VStack(spacing: 20) {

            Text(produto.nome)
                .font(.largeTitle)

            Text("R$ \(produto.preco, specifier: "%.2f")")
                .font(.title)

            Button("Adicionar ao Carrinho") {

                carrinhoVM.adicionar(produto: produto)

            }

        }

    }

}
