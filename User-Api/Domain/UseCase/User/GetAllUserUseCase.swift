//
//  GetAllUserUseCase.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

import Combine

class GetAllUserUseCase {
    private let userRepository : UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute() -> AnyPublisher<[User], Error> {
        return userRepository.getAllUser()
            .map {
                $0.toUser()
            }
            .eraseToAnyPublisher()
    }
}
