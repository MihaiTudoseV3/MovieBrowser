//
//  Router.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import SwiftUI

@Observable
class Router {
    var path: [Destination] = []
    
    func navigateTo(_ destination: Destination) {
        path.append(destination)
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func pop() {
        path.removeLast()
    }
}
