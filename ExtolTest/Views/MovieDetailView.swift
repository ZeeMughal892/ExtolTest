//
//  MovieDetailView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var viewModel = MoviesViewModel()
    var id: Int
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image(uiImage: UIImage().convertUrlToImage(endpoint: viewModel.movie?.backdropPath ?? ""))
                        .resizable()
                        .scaledToFit()
                    Rectangle().foregroundColor(Color("shadowColor")).opacity(0.75)
                    MovieHeaderView(movie: viewModel.movie)
                        .foregroundColor(.white)
                }
                VStack {
                    Text("OVERVIEW").font(.system(size: 16.0)).fontWeight(.heavy)
                        .padding(.vertical)
                    
                    Text(viewModel.movie?.overview ?? "")
                        .font(.footnote)
                        .frame(alignment: .center)
                    
                    Text("GENRE").font(.system(size: 16.0)).fontWeight(.heavy)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        ForEach(viewModel.movie?.genres ?? [], id:\.id) { genre in
                            Text(genre.name ?? "")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("PRODUCTION COMPANIES").font(.system(size: 16.0)).fontWeight(.heavy)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        ForEach(viewModel.movie?.productionCompanies ?? [], id:\.id) { company in
                            Text(company.name ?? "")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                Spacer()
            }
            
        }.ignoresSafeArea()
            .onAppear {
                let movieParamObject = MovieParamObject(api_key: Strings.Common.apiKey)
                viewModel.getMovieDetail(id: id, movieParamObject: movieParamObject)
            }
    }
}

