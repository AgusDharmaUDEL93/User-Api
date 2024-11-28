//
//  Router.swift
//  User-Api
//
//  Created by Agus Dharma Kusuma on 27/11/24.
//

import Observation
import SwiftUI

@Observable
class Router {
    var navPath = NavigationPath()
    
    public enum Destination : Codable, Hashable {
        case user
        case userDetail(id : Int)
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
