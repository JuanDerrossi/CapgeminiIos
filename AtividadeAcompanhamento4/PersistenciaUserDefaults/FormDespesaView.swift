import SwiftUI

struct FormDespesaView: View {

    @Environment(\.managedObjectContext)
    private var viewContext

    @Environment(\.dismiss)
    private var dismiss

    var despesa: Despesa?

    @State private var categoria = ""
    @State private var valor = ""
    @State private var mes = "Janeiro"

    let meses = [
        "Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio"
    ]

    let categorias = [
        "Energia",
        "Internet",
        "Água",
        "Assinaturas",
        "Aluguel",
        "Mercado",
        "Cursos",
        "Lazer"
    ]

    private func salvar() {

        let currentDespesa = despesa ?? Despesa(context: viewContext)

        if despesa == nil {
            currentDespesa.id = UUID()
        }

        currentDespesa.categoria = categoria
        currentDespesa.mes = mes
        currentDespesa.valor = Double(valor) ?? 0

        try? viewContext.save()
    }

    var body: some View {

        Form {

            Section("Categoria") {

                Picker("Categoria", selection: $categoria) {

                    ForEach(categorias, id: \.self) { item in
                        Text(item)
                    }
                }
            }

            Section("Mês") {

                Picker("Mês", selection: $mes) {

                    ForEach(meses, id: \.self) { item in
                        Text(item)
                    }
                }
            }

            Section("Valor") {

                TextField("Digite o valor",
                          text: $valor)
                .keyboardType(.decimalPad)
            }

            Button {

                salvar()
                dismiss()

            } label: {

                Text("Salvar")
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(
            despesa == nil
            ? "Cadastrar"
            : "Editar"
        )
        .onAppear {

            if let d = despesa {

                categoria = d.categoria ?? ""
                mes = d.mes ?? "Janeiro"
                valor = String(d.valor)
            } else {

                categoria = categorias[0]
            }
        }
    }
}
