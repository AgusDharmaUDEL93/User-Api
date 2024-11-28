//
//  UserDto+Extensions.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

extension UserDto {
    func toUser () -> [User] {
        return users.map({ user in
            User(id: user.id, name: user.firstName + user.maidenName + user.lastName)
        })
    }
}
