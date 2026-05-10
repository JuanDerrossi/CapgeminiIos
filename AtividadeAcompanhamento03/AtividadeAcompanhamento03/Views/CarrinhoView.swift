import SwiftUI
import Combine

struct CarrinhoView: View {

    @EnvironmentObject var carrinhoVM: CarrinhoViewModel

    var body: some View {

        VStack {

            List {

                ForEach(carrinhoVM.itens) { item in

                    HStack {

                        VStack(alignment: .leading) {

                            Text(item.produto.nome)

                            Text("Quantidade: \(item.quantidade)")

                        }

                        Spacer()

                        Button("Remover") {
                            carrinhoVM.remover(item: item)
                        }

                    }

                }

            }

            Text("Total: R$ \(carrinhoVM.total, specifier: "%.2f")")
                .font(.title2)
                .padding()

        }
        .navigationTitle("Carrinho")

    }

}
