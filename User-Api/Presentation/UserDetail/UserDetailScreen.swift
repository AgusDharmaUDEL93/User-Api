//
//  Untitled.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import SwiftUI

struct UserDetailScreen: View {
    
    @State var id : Int
    
    var body: some View {
        ScrollView {
            Text("Id : ")
            Text("Name : ")
            Text("Email : ")
        }
    }
}

#Preview {
    NavigationStack {
        UserDetailScreen(id : 1)
    }
}
