// Obter um nome
//print("olá! Informe um nome.")
//var nome: String = readLine()!

//Retornar uma mensagem concatenada com o nome
//print("Bom dia, \(nome)!")

class OldListas {
    var nomes = ["Juan","Larissa","Leonardo"]
    var idades = ["24","14","50"]
    var telefones = ["1025","1167","7610"]
    var emails = ["juan@gmail.com","larissa@gmail.com","leonardo@gmail.com"]
}

let lista = OldListas()

func apresentarLista() {
    for i in 0..<lista.nomes.count {
        print("Nome: \(lista.nomes[i]) | Idade: \(lista.idades[i]) | Telefone: \(lista.telefones[i]) | Email: \(lista.emails[i])")
    }
}

func menu() {
    while true {
        print("Escolha uma Opcao: 1 - Mostrar lista , 2 - Cadastar Pessoa , 3 Editar Pessoa , 4 Remover pessoa , 5 Sair")
        
        guard let input = readLine(), let numeroEscolha = Int(input) else {
            print("entrada Invalida")
            continue
        }
        
        switch numeroEscolha {
        case 1:
            apresentarLista()
        case 2 :
            cadastrarPessoa()
        case 3 :
            EditarPessoa()
        case 4 :
            removerPessoa()
        case 5 :
            print("até mais")
            return
        default:
            print("tente denvovo")
        }
    }
}
menu()

struct Pessoa {
    var nome: String
    var idade: String
    var telefone: String
    var email: String
}

func removerPessoa() {
    print("Qual pessoa deseja remover? \(lista.nomes)")
    let nome = readLine()!
    
    for i in 0..<lista.nomes.count {
        if lista.nomes[i] == nome {
                lista.nomes.remove(at: i)
                lista.idades.remove(at: i)
                lista.telefones.remove(at: i)
                lista.emails.remove(at: i)
                print("lista atualizada")
            menu()
        } else {
            print("Nome não encontrado, tente novamente")
            removerPessoa()
        }
        }
    }


func EditarPessoa() {
    print("Qual pessoa deseja alterar? \(lista.nomes)")
    let nome = readLine()!
    if let index = lista.nomes.firstIndex(of: nome) {
        
        print("digite um novo nome")
        let novoNome = readLine()!
        
        print("digite uma nova idade")
        let novaIdade = readLine()!
        
        print("digite um novo telefone")
        let novoTelefone = readLine()!
        
        print("digite um novo email")
        let novoEmail = readLine()!
        
        lista.nomes[index] = novoNome
        lista.idades[index] = novaIdade
        lista.telefones[index] = novoTelefone
        lista.emails[index] = novoEmail
        
    } else {
        print("Nome não encontrado tente novamente")
        EditarPessoa()
    }
}

func cadastrarPessoa() {
  print("Digite um nome:")
    let nome = readLine()!
    if(lista.nomes.contains(nome)) {
        print("nome já inserido na lista, tente novamente")
        cadastrarPessoa()
    }else{
        lista.nomes.append(nome)
    }
    
  print("Digite uma idade")
    let idade = readLine()!
    
    print("Digite uma telefone")
    let telefone = readLine()!
    
    print("Digite um email")
    let email = readLine()!
    
    lista.idades.append(idade)
    lista.telefones.append(telefone)
    lista.emails.append(email)
    apresentarLista()
}
