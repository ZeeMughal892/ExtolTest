//
//  MovieTileView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MovieTileView: View {
    
    var movie: ResultModel
    
    var body: some View {
        ZStack {
            HStack {
                Image(uiImage: UIImage().convertUrlToImage(endpoint: movie.posterPath ?? ""))
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(movie.originalTitle ?? "")
                        .font(.headline)
                        .bold()
                    Text(movie.releaseDate ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer(minLength: 8)
                    Text(movie.overview ?? "")
                        .font(.footnote)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
            }
        }
        .foregroundColor(.black)
        .cornerRadius(8)
        .frame(maxWidth: .infinity, maxHeight: 150)
    }
}
