import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext)
    private var context

    @FetchRequest(
        sortDescriptors: []
    ) var contatos: FetchedResults<Contato>

    var body: some View {

        NavigationView {

            List {

                ForEach(contatos) { contato in

                    VStack(alignment: .leading) {

                        Text(contato.nome ?? "")
                            .font(.headline)

                        Text(contato.email ?? "")

                        Text(contato.telefone ?? "")
                    }
                }
                .onDelete(perform: deletar)
            }
            .navigationTitle("Contatos")
            .toolbar {

                NavigationLink(
                    destination: CadastroView()
                ) {

                    Image(systemName: "plus")
                }
            }
        }
    }

    func deletar(at offsets: IndexSet) {

        for index in offsets {

            let contato = contatos[index]
            context.delete(contato)
        }

        do {
            try context.save()
        } catch {
            print("Erro ao deletar")
        }
    }
}


