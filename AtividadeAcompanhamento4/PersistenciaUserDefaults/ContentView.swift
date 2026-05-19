import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext)
    private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Despesa.mes, ascending: true)
        ],
        animation: .default
    )
    var despesas: FetchedResults<Despesa>

    private func deleteDespesa(offsets: IndexSet) {

        for index in offsets {
            viewContext.delete(despesas[index])
        }

        try? viewContext.save()
    }

    var body: some View {

        NavigationStack {

            List {

                ForEach(despesas) { despesa in

                    NavigationLink {
                        FormDespesaView(despesa: despesa)
                    } label: {

                        VStack(alignment: .leading, spacing: 5) {

                            Text(despesa.categoria ?? "")
                                .font(.headline)

                            Text("Mês: \(despesa.mes ?? "")")

                            Text(
                                "Valor: R$ \(despesa.valor, specifier: "%.2f")"
                            )
                        }
                    }
                }
                .onDelete(perform: deleteDespesa)
            }
            .navigationTitle("Despesas")
            .toolbar {

                ToolbarItem {

                    NavigationLink {
                        FormDespesaView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
