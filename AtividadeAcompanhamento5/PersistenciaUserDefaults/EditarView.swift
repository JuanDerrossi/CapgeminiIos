import SwiftUI

struct EditarView: View {

    @Environment(\.managedObjectContext)
    private var context

    @Environment(\.dismiss)
    var dismiss

    var contato: Contato

    @State var nome: String
    @State var email: String
    @State var telefone: String
    @State var nascimento: String
    @State var cep: String
    @State var bairro: String
    @State var logradouro: String
    @State var numero: String
    @State var estado: String
    @State var cidade: String

    var body: some View {

        Form {

            Section(header: Text("Dados")) {

                TextField("Nome", text: $nome)

                TextField("Email", text: $email)

                TextField("Telefone", text: $telefone)

                TextField("Nascimento", text: $nascimento)
            }

            Section(header: Text("Endereço")) {

                TextField("CEP", text: $cep)

                Button("Buscar CEP") {

                    ViaCEPService.buscarCEP(cep: cep) { resultado in

                        guard let endereco = resultado else { return }

                        logradouro = endereco.logradouro
                        bairro = endereco.bairro
                        cidade = endereco.localidade
                        estado = endereco.uf
                    }
                }

                TextField("Logradouro", text: $logradouro)

                TextField("Número", text: $numero)

                TextField("Bairro", text: $bairro)

                TextField("Cidade", text: $cidade)

                TextField("Estado", text: $estado)
            }

            Button("Salvar Alterações") {

                contato.nome = nome
                contato.email = email
                contato.telefone = telefone
                contato.nascimento = nascimento
                contato.cep = cep
                contato.bairro = bairro
                contato.logradouro = logradouro
                contato.numero = numero
                contato.estado = estado
                contato.cidade = cidade

                do {

                    try context.save()

                    dismiss()

                } catch {

                    print("Erro ao editar")
                }
            }
        }
        .navigationTitle("Editar")
    }
}
