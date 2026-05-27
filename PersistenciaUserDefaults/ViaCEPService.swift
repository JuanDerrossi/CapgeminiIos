import Foundation

struct ViaCEPResponse: Codable {
    let logradouro: String
    let bairro: String
    let localidade: String
    let uf: String
}

class ViaCEPService {

    static func buscarCEP(
        cep: String,
        completion: @escaping (ViaCEPResponse?) -> Void
    ) {

        let urlString = "https://viacep.com.br/ws/\(cep)/json/"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in

            guard let data = data else {
                completion(nil)
                return
            }

            let resultado = try? JSONDecoder().decode(ViaCEPResponse.self, from: data)

            DispatchQueue.main.async {
                completion(resultado)
            }

        }.resume()
    }
}
