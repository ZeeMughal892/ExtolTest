//
//  MovieTileView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MovieTileView: View {
    
    var movie: ResultModel
    var isLast: Bool
    @ObservedObject var viewModel: MoviesViewModel
    var page = 1
    
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
                        .padding(.bottom)
                    
                    if isLast {
                        Text(movie.overview ?? "")
                            .font(.footnote)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .onAppear {
                                ProgressView(value: 6.7, total: 10.0)
                                    .progressViewStyle(.circular)
                                let movieParamObject = MovieParamObject(api_key: Strings.Common.apiKey, page: page + 1)
                                viewModel.getAllMovies(movieParamObject: movieParamObject)
                            }
                    } else {
                        Text(movie.overview ?? "")
                            .font(.footnote)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .foregroundColor(.black)
        .cornerRadius(8)
        .frame(maxWidth: .infinity, maxHeight: 150)
    }
}
