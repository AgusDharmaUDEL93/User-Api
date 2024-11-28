//
//  UserViewModel.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Observation
import Combine
import Foundation

@Observable
class UserViewModel {
    @ObservationIgnored
    private var userUseCase = UserUseCases.shared
    @ObservationIgnored
    private var cancellables = Set<AnyCancellable>()
    
    var user : [User] = []
    var errorMessage : String?
    var isLoading = false
    
    
    
    func getAllUser () {
        isLoading = true
        userUseCase.getAllUserUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Success")
                        break
                    case .failure(let error):
                        print(error)
                        self.errorMessage = error.localizedDescription
                    }
                    self.isLoading = false
                }, receiveValue: { [weak self] user in
                    self?.user = user
                    print("Get Value")
                }
            )
            .store(in: &cancellables)
    }
    
    func clearErrorMessage() {
        errorMessage = nil
    }
}
