//
//  Untitled.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import SwiftUI

struct UserDetailScreen: View {
    
    @State var id : Int
    @State var viewModel = UserDetailViewModel()
    
    var body: some View {
        Group {
            if (viewModel.isLoading){
                VStack {
                    ProgressView()
                }
            } else {
                ScrollView  {
                    VStack (alignment : .leading) {
                        Text("Id : \( viewModel.user?.id ?? 0 ) ")
                        Text("Name : \(viewModel.user?.name ?? "No Name")")
                        Text("Email : \(viewModel.user?.email ?? "No Email")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                   
                }
            }
        }
        .navigationTitle("User Detail")
        .onAppear{
            viewModel.getUserDetailById(id: id)
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
        UserDetailScreen(id : 1)
    }
}
