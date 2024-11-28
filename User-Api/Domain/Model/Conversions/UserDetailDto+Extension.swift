//
//  UserDetailDto+Extension.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 29/11/24.
//

extension UserDetailDto {
    func toUserDetail () -> UserDetail {
        return UserDetail(id: self.id, name: firstName + maidenName + lastName, email: email)
    }
}
