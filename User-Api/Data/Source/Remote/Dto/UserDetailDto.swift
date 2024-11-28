//
//  UserDetailDto.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userDetailDto = try? JSONDecoder().decode(UserDetailDto.self, from: jsonData)

import Foundation

// MARK: - UserDetailDto
struct UserDetailDto: Codable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let hair: Hair
    let ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    let role: String
}
