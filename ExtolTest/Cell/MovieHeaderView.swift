//
//  MovieHeaderView.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 23/10/2022.
//

import SwiftUI

struct MovieHeaderView: View {
    
    var movie: MovieModel?
    
    var body: some View {
        VStack {
            Text(movie?.title ?? "").font(.system(size: 32.0)).fontWeight(.heavy)
            Text(movie?.tagline ?? "").font(.footnote)
            ZStack {
                ProgressView(value: 6.7, total: 10.0)
                    .progressViewStyle(GaugeProgressStyle())
                    .frame(width: 50, height: 50)
                Text(String(movie?.voteAverage ?? 0.0) + "%").font(.system(size: 12.0))
            }
        }
    }
}
