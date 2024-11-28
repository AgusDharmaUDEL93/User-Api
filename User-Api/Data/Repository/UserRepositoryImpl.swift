//
//  UserRepositoryImpl.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Combine

class UserRepositoryImpl : UserRepository {
    
    private let dataSource = UserDataSource.shared
    
    static let shared = UserRepositoryImpl()
    
    func getAllUser() -> AnyPublisher<UserDto, Error> {
        return dataSource.getAllUser()
    }
    
    func getUserDetail(id: Int) -> AnyPublisher<UserDetailDto, any Error> {
        return dataSource.getUserDetail(id: id)
    }
    
    
}
