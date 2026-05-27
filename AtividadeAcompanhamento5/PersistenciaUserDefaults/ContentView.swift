import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext)
    private var context

    @FetchRequest(
        entity: Contato.entity(),
        sortDescriptors: []
    ) var contatos: FetchedResults<Contato>

    var body: some View {

        NavigationView {

            List {

                ForEach(contatos) { contato in

                    NavigationLink {

                        EditarView(
                            contato: contato,
                            nome: contato.nome ?? "",
                            email: contato.email ?? "",
                            telefone: contato.telefone ?? "",
                            nascimento: contato.nascimento ?? "",
                            cep: contato.cep ?? "",
                            bairro: contato.bairro ?? "",
                            logradouro: contato.logradouro ?? "",
                            numero: contato.numero ?? "",
                            estado: contato.estado ?? "",
                            cidade: contato.cidade ?? ""
                        )

                    } label: {

                        VStack(alignment: .leading) {

                            Text(contato.nome ?? "")
                                .font(.headline)

                            Text(contato.email ?? "")

                            Text(contato.telefone ?? "")
                        }
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
