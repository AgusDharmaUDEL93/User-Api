//
//  UserViewModel.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Observation

@Observable
class UserViewModel {
    private var userUseCase = UserUseCases.shared
    
    func getAllUser () {
        userUseCase.getAllUserUseCase.execute()
            .sink(receiveCompletion: { [weak self] completion in
                
            }, receiveValue: { [weak self] user in 
                
            })
    }
}
