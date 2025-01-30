//
//  MovieInfoView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 30.01.2025.
//

import SwiftUI

struct MovieInfoView: View {
    
    private let title: String
    private let value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MovieInfoView_Preview: PreviewProvider {
    static var previews: some View {
        MovieInfoView(title: "Title", value: "Value")
    }
}
