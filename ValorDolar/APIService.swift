import Foundation

struct APIService {
    let urlString: String
    
    func getJSON<T: Decodable>() async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}
