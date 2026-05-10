import SwiftUI

struct CategoriaView: View {

    @EnvironmentObject var roteador: Roteador
    @EnvironmentObject var produtoVM: ProdutoViewModel

    let categoria: String

    var body: some View {

        List {

            ForEach(
                produtoVM.produtos.filter {
                    $0.categoria == categoria
                }
            ) { produto in

                Button {

                    roteador.navegar(.detalhe(produto))

                } label: {

                    HStack {

                        Text(produto.nome)

                        Spacer()

                        Text("R$ \(produto.preco, specifier: "%.2f")")

                    }

                }

            }

        }
        .navigationTitle(categoria)

    }

}