//
//  ContentView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    @State var selectedTag: Bool = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.allMovies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(id: movie.id ?? 0)) {
                            MovieTileView(movie: movie)
                        }
                    }
                }
                .padding()
                .navigationTitle("Movies")
            }
            .refreshable {
                makeCall()
            }
        }.onAppear {
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
