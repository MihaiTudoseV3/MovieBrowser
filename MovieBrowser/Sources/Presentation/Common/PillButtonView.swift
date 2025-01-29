//
//  PillButtonView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import SwiftUI

struct PillButtonView: View {
    
    private let title: String
    private let action: () -> Void
    
    init (title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .overlay(
                    Capsule()
                        .stroke(.gray, lineWidth: 1)
                )
        }
    }
}
