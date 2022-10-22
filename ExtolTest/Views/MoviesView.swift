//
//  ContentView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.allMovies, id: \.id) { movie in
                        
                    }
                }
                .padding()
            }
        }.onAppear {
            let movieParamObject = MovieParamObject(api_key: Strings.Common.apiKey)
            viewModel.getAllMovies(movieParamObject: movieParamObject)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
