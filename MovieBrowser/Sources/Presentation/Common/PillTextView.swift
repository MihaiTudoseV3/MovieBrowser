//
//  GenreTagView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

@MainActor
struct PillTextView: View {
    
    private let text: String
    private let textColor: Color
    private let backgroundColor: Color
    
    init(text: String,
         textColor: Color = .blue,
         backgroundColor: Color = Color(red: 173/255, green: 216/255, blue: 230/255)) {
        
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption2)
            .foregroundColor(textColor)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(
                Capsule()
                    .fill(backgroundColor)
            )
    }
}

struct PillTextView_Preview: PreviewProvider {
    static var previews: some View {
        PillTextView(text: "Pill-Shaped Text")
    }
}
