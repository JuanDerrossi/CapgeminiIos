import Foundation
import CoreData

class ContatoViewModel: ObservableObject {

    @Published var nome = ""
    @Published var email = ""
    @Published var telefone = ""
    @Published var nascimento = ""
    @Published var cep = ""
    @Published var bairro = ""
    @Published var logradouro = ""
    @Published var numero = ""
    @Published var estado = ""
    @Published var cidade = ""

    func buscarCEP() {

        ViaCEPService.buscarCEP(cep: cep) { resultado in

            guard let endereco = resultado else { return }

            self.logradouro = endereco.logradouro
            self.bairro = endereco.bairro
            self.cidade = endereco.localidade
            self.estado = endereco.uf
        }
    }

    func salvar(context: NSManagedObjectContext) {

        let novoContato = Contato(context: context)

        novoContato.nome = nome
        novoContato.email = email
        novoContato.telefone = telefone
        novoContato.nascimento = nascimento
        novoContato.cep = cep
        novoContato.bairro = bairro
        novoContato.logradouro = logradouro
        novoContato.numero = numero
        novoContato.estado = estado
        novoContato.cidade = cidade

        do {
            try context.save()
        } catch {
            print("Erro ao salvar")
        }
    }
}
