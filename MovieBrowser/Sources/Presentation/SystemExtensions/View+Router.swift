//
//  View+Router.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import SwiftUI

extension View {
    func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
