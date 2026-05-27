import SwiftUI

struct CadastroView: View {

    @Environment(\.managedObjectContext)
    private var context

    @Environment(\.dismiss)
    var dismiss

    @StateObject var vm = ContatoViewModel()

    var body: some View {

        Form {

            Section(header: Text("Dados")) {

                TextField("Nome", text: $vm.nome)

                TextField("Email", text: $vm.email)

                TextField("Telefone", text: $vm.telefone)

                TextField("Nascimento", text: $vm.nascimento)
            }

            Section(header: Text("Endereço")) {

                TextField("CEP", text: $vm.cep)

//                Button("Buscar CEP") {
//                    vm.buscarCEP()
//                }

                TextField("Logradouro", text: $vm.logradouro)

                TextField("Número", text: $vm.numero)

                TextField("Bairro", text: $vm.bairro)

                TextField("Cidade", text: $vm.cidade)

                TextField("Estado", text: $vm.estado)
            }

            Button("Salvar") {

                vm.salvar(context: context)

                dismiss()
            }
        }
        .navigationTitle("Cadastro")
    }
}
