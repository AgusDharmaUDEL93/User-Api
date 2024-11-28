//
//  APIClient.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

import Foundation
import Combine

class APIClient {
    
    private let session: URLSession
    
    static let shared = APIClient()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(url: URL, method: HTTPMethod) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return session.dataTaskPublisher(for: request)
            .tryMap{ output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
