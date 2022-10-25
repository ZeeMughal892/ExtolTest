//
//  ContentView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()

    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List(0..<viewModel.allMovies.count, id: \.self) { i in
                    NavigationLink(destination: MovieDetailView(viewModel: viewModel, id: viewModel.allMovies[i].id ?? 0)) {
                        if i == self.viewModel.allMovies.count - 1 {
                            MovieTileView(movie: viewModel.allMovies[i], isLast: true, viewModel: viewModel)
                        } else {
                            MovieTileView(movie: viewModel.allMovies[i], isLast: false, viewModel: viewModel)
                        }
                    }
                }.refreshable {
                    viewModel.allMovies = []
                    makeCall()
                }
                .navigationTitle("Movies")
            } else {
                // Fallback on earlier versions
            }
        }
        
        .onAppear {
            makeCall()
        }
    }
    
    func makeCall() {
        let movieParamObject = MovieParamObject(api_key: Strings.Common.apiKey)
        viewModel.getAllMovies(movieParamObject: movieParamObject)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
