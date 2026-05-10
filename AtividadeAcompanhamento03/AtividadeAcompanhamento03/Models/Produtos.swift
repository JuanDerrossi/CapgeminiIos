import Foundation

struct Produto: Identifiable, Hashable {
    let id = UUID()
    let nome: String
    let preco: Double
    let categoria: String
}