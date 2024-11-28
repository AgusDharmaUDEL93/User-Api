//
//  UserUseCases.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

class UserUseCases {
    let getAllUserUseCase = GetAllUserUseCase(userRepository: UserRepositoryImpl.shared)
    
    static let shared = UserUseCases()
}
