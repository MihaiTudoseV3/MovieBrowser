//
//  RatingView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

struct RatingView: View {
    
    private var rating: String
    
    init(_ rating: String) {
        self.rating = rating
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.caption)
                
            Text(rating)
                .font(.caption)
                .foregroundColor(.gray)
            
        }
    }
}

struct RatingView_Preview: PreviewProvider {
    static var previews: some View {
        RatingView("4.5/9.0 IMDb")
    }
}

