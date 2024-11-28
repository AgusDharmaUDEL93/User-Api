//
//  UserScreen.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import SwiftUI

struct UserScreen : View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        List {
            Button(
                action: {
                    router.navigate(to: .userDetail(id: 1))
                },
                label: {
                    HStack {
                        Text ("Agus Dharma Kusuma")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
            )
            .buttonStyle(.plain)
            
        }
        .navigationTitle("List User")
    }
}

#Preview {
    NavigationStack {
        UserScreen()
    }
    .environment(Router())
}
