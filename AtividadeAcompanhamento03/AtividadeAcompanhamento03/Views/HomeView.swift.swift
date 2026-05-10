import SwiftUI
import Combine

struct HomeView: View {

    @EnvironmentObject var roteador: Roteador

    var body: some View {

        VStack(spacing: 20) {

            Text("ShopMaster")
                .font(.largeTitle)

            Button("Eletrônicos") {
                roteador.navegar(.categoria("Eletrônicos"))
            }

            Button("Roupas") {
                roteador.navegar(.categoria("Roupas"))
            }

            Button("Casa") {
                roteador.navegar(.categoria("Casa"))
            }

            Button("Carrinho") {
                roteador.navegar(.carrinho)
            }

        }

    }

}
