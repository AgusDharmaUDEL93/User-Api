//
//  GetUserDetailUseCase.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//


import Combine

class GetUserDetailUseCase {
    private let userRepository : UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(id : Int) -> AnyPublisher<UserDetail, Error> {
        return userRepository.getUserDetail(id: id)
            .map{
                $0.toUserDetail()
            }
            .eraseToAnyPublisher()
    }
}
