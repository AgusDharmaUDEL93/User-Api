//
//  UserDetailViewModel.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Observation
import Combine
import Foundation

@Observable
class UserDetailViewModel {
    @ObservationIgnored
    private var userUseCase = UserUseCases.shared
    @ObservationIgnored
    private var cancellables = Set<AnyCancellable>()
    
    var user : UserDetail?
    var errorMessage : String?
    var isLoading = false
    
    func getUserDetailById (id : Int) {
        isLoading = true
        userUseCase.getUserDetailUseCase.execute(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                        
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                    self.isLoading = false
                },
                receiveValue: { [weak self] user in
                    self?.user = user
                }
            )
            .store(in: &cancellables)
    }
}
