//
//  UserDataSource.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

import Combine
import Foundation

class UserDataSource {
    private var apiClient = APIClient.shared
    private var appConfiguration = AppConfiguration.shared
    
    static let shared = UserDataSource()
    
    
    func getAllUser ()  -> AnyPublisher<UserDto, Error> {
        
        guard let url = URL(string: appConfiguration.baseURL + "users") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return apiClient.request(url: url, method: .get)
    }
    
    
    func getUserDetail (id : Int) -> AnyPublisher<UserDetailDto, Error> {
        guard let url = URL(string: appConfiguration.baseURL + "users/\(id)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return apiClient.request(url: url, method: .get)
    }
}
