//
//  CastMemberView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 30.01.2025.
//

import SwiftUI

struct CastMemberView: View {
    
    private let imageUrl: String
    private let name: String
    
    init(imageUrl: String, name: String) {
        self.imageUrl = imageUrl
        self.name = name
    }
    
    var body: some View {
        VStack {
            asyncImage(url: imageUrl)
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(name)
                .font(.footnote)
                .frame(width: 70, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private func asyncImage(url: String) -> some View {
        Group{
            if let url = URL(string: url) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Image(systemName: "movieclapper")
                                .resizable()
                                .scaledToFit()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    case .failure:
                        Image(systemName: "movieclapper")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image(systemName: "movieclapper")
                            .resizable()
                            .scaledToFit()
                    }
                }
            } else {
                Image(systemName: "movieclapper")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct CastMemberView_Preview: PreviewProvider {
    static var previews: some View {
        CastMemberView(imageUrl: "", name: "Name")
    }
}
