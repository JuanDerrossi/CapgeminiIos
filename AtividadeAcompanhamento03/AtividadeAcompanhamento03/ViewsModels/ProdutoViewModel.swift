import SwiftUI
import Combine

class ProdutoViewModel: ObservableObject {

    @Published var produtos: [Produto] = [

        Produto(
            nome: "iPhone",
            preco: 5000,
            categoria: "Eletrônicos"
        ),

        Produto(
            nome: "Notebook",
            preco: 3500,
            categoria: "Eletrônicos"
        ),

        Produto(
            nome: "Camiseta",
            preco: 80,
            categoria: "Roupas"
        ),

        Produto(
            nome: "Tênis",
            preco: 200,
            categoria: "Roupas"
        ),

        Produto(
            nome: "Cadeira",
            preco: 450,
            categoria: "Casa"
        )
    ]

}
