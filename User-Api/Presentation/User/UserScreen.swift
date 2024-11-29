//
//  UserScreen.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import SwiftUI

struct UserScreen : View {
    
    @Environment(Router.self) var router
    @State var viewModel = UserViewModel()
    
    var body: some View {
        Group {
            if (viewModel.isLoading){
                VStack {
                    ProgressView()
                }
            } else {
                if (viewModel.user.isEmpty){
                    VStack {
                        Text("No user data")
                    }
                } else {
                    List {
                        ForEach(viewModel.user, id: \.id){ user in
                            Button(
                                action: {
                                    router.navigate(to: .userDetail(id: 1))
                                },
                                label: {
                                    HStack {
                                        Text (user.name)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                    }
                                }
                            )
                            .buttonStyle(.plain)
                        }
                    }
                }
                
            }
        }
        .navigationTitle("List User")
        .onAppear {
            viewModel.getAllUser()
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: {_ in}
            ),
            actions: {
                Button(
                    role: .cancel,
                    action: {
                        viewModel.clearErrorMessage()
                    },
                    label: {
                        Text("Okay")
                    }
                )
            },
            message: {
                Text(viewModel.errorMessage ?? "Unexpected Error Occured")
            }
        )
    }
}

#Preview {
    NavigationStack {
        UserScreen()
    }
    .environment(Router())
}
