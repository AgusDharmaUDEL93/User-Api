//
//  ContentView.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var router = Router()
    
    var body: some View {
        NavigationStack (path: $router.navPath ) {
            UserScreen()
                .navigationDestination(
                    for: Router.Destination.self,
                    destination: { destination in
                        switch destination {
                        case .user:
                            UserScreen()
                        case .userDetail(let id):
                            UserDetailScreen(id: id)
                        }
                    }
                )
        }
        .environment(router)
        
    }
}

#Preview {
    ContentView()
}
