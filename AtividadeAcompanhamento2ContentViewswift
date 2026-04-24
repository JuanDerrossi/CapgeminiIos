import SwiftUI

struct Perguntas {
    var pergunta : String
    var opcoes : [String]
    var respostaCorreta : Int
}

let temas: [String: [Perguntas]] = [
    "Perguntas sobre mim": [
        Perguntas(pergunta: "Com o que eu trabalho", opcoes: ["Programacao","Educacao fisica","Musico","Professor"], respostaCorreta: 0),
        Perguntas(pergunta: "O que eu sou no meu trabalho", opcoes: ["QA","Back-end","Front-end","Full Stacks"], respostaCorreta: 3),
        Perguntas(pergunta: "O que eu mais gosto de fazer", opcoes: ["Sair","Treinar","Programa","Conversar"], respostaCorreta: 2),
        Perguntas(pergunta: "Qual meu jogo favorito?", opcoes: ["God of War","Dark Souls","Undertale","Magic"], respostaCorreta: 2),
        Perguntas(pergunta: "Qual meu maior sonho?", opcoes: ["Comecar a trabalhar fora","Compara uma casa","Viajar para outro pais","Ser um jogador profissonal"], respostaCorreta: 1),
    ],
    "Filmes": [
        Perguntas(pergunta: "Qual filme é dos anos 2000", opcoes: ["Vingadores","Matrix","X-men","Frozen"], respostaCorreta: 2),
        Perguntas(pergunta: "Qual é o protagonista do Matrix", opcoes: ["One","Max","Trinity","Neo"], respostaCorreta: 3),
        Perguntas(pergunta: "Qual filme fala sobre Herois", opcoes: ["O quinto elemento","O pianista","Memento","Homen-aranha"], respostaCorreta: 3),
        Perguntas(pergunta: "Qual é o nome do pai do Luke", opcoes: ["Tatuin","Palpatine","Yoda","Darth Veider"], respostaCorreta: 3),
        Perguntas(pergunta: "Quem é o treinador do Luke", opcoes: ["Luke","Yoda","Indiana Jones","Darth Veider"], respostaCorreta: 1),
    ]
]

struct ContentView: View {
    @Binding var document: AtividadeAcompanhamento2Document
    @State var temaSelecionado: String? = nil
    @State var indicePergunta = 0
    @State var pontuacao = 0
    @State var mostrarResultado = false
    @State var mostrarAlerta = false
    @State var menssagem = ""
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack{
                if temaSelecionado == nil {
                    Text("Escolha um Tema").font(.largeTitle).bold()
                    
                    List(Array(temas.keys),id: \.self) {
                        tema in Button(tema){
                            temaSelecionado = tema
                            indicePergunta = 0
                            pontuacao = 0
                        }
                    }
                }
                
                else if !mostrarResultado {
                    let perguntas = temas[temaSelecionado!]!
                    
                    Text(perguntas[indicePergunta].pergunta)
                        .font(.title)
                        .padding()
                    
                    Text("Pergunta \(indicePergunta + 1)/5")
                        .font(.title2)
                        .padding()
                    
                    
                    ForEach(perguntas[indicePergunta].opcoes.indices, id: \.self){ i in
                        Button(perguntas[indicePergunta].opcoes[i]){
                            
                            if i == perguntas[indicePergunta].respostaCorreta {
                                pontuacao += 1
                                menssagem = "Resposta Correta"
                            } else {
                                let correta = perguntas[indicePergunta].opcoes[
                                    perguntas[indicePergunta].respostaCorreta
                                ]
                                menssagem = "Errado! Correta: \(correta)"
                            }
                            mostrarAlerta = true
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal)
                }
                else{
                    Text("Resultado Final")
                        .font(.largeTitle)
                    
                    Text("Acertos: \(pontuacao)")
                    Text("Erros \(5 - pontuacao )")
                    
                    Button("Jogar novamente?") {
                        temaSelecionado = nil
                        mostrarResultado = false
                    }
                    .padding()
                    .background(Color.green)
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .alert(menssagem, isPresented: $mostrarAlerta) {
            Button("Ok") {
                proximaPerguna()
            }
        }
    }
    
    func proximaPerguna() {
        indicePergunta += 1
        
        if indicePergunta >= 5 {
            mostrarResultado = true
        }
    }
}

#Preview {
    ContentView(document: .constant(AtividadeAcompanhamento2Document()))
}
