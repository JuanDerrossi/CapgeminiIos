import Foundation

struct ItemCarrinho: Identifiable {
    let id = UUID()
    let produto: Produto
    var quantidade: Int
}