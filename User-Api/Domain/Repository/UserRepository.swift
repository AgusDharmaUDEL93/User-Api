//
//  UserRepository.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

protocol UserRepository {
    func getAllUser () async throws -> UserDto
    
    func getUserDetail (id : Int) async throws -> UserDetailDto
}
