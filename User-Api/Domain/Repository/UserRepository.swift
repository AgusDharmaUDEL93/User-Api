//
//  UserRepository.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Combine

protocol UserRepository {
    func getAllUser () -> AnyPublisher<UserDto, Error>
    
    func getUserDetail (id : Int)  -> AnyPublisher<UserDetailDto, Error>
}
