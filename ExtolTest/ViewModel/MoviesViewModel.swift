//
//  MoviesViewModel.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import Foundation


class MoviesViewModel: ObservableObject {
    
    @Published var allMovies: [ResultModel] = []
    
    //Fetching All Movies
    func getAllMovies(movieParamObject: MovieParamObject) {
        let queryItems = [
            URLQueryItem(name: APIParamKeys.apiKey, value: movieParamObject.api_key),
            URLQueryItem(name: APIParamKeys.language, value: movieParamObject.language),
            URLQueryItem(name: APIParamKeys.page, value: String(movieParamObject.page ?? 1))
        ]
        guard var url = URL(string: ApiUrls.getAllMovies) else { fatalError(Strings.Error.missingurl) }
        url.append(queryItems: queryItems)
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(Strings.Error.request, error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let movies = try JSONDecoder().decode(AllMoviesModel.self, from: data)
                        self.allMovies.append(contentsOf: movies.results ?? [])
                    } catch let error {
                        print(Strings.Error.decoding, error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
}
