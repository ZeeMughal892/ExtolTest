//
//  MoviesViewModel.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import Foundation


class MoviesViewModel: ObservableObject {
    
    @Published var allMovies: [ResultModel] = []
    @Published var movie: MovieModel?

    //Fetching All Movies
    func getAllMovies(movieParamObject: MovieParamObject) {
        let queryItems = [
            URLQueryItem(name: APIParamKeys.apiKey, value: movieParamObject.api_key),
            URLQueryItem(name: APIParamKeys.language, value: movieParamObject.language),
            URLQueryItem(name: APIParamKeys.page, value: String(movieParamObject.page ?? 1))
        ]
        guard let url = URL(string: ApiUrls.getAllMovies + "?\(queryItems[0])" + "&\(queryItems[1])" + "&\(queryItems[2])") else { fatalError(Strings.Error.missingurl) }
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
    
    func getMovieDetail(id: Int, movieParamObject: MovieParamObject) {
        let queryItems = [
            URLQueryItem(name: APIParamKeys.apiKey, value: movieParamObject.api_key),
        ]
        guard let url = URL(string: ApiUrls.baseUrl + String(id) + "?\(queryItems[0])") else { fatalError(Strings.Error.missingurl) }
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
                        self.movie = try JSONDecoder().decode(MovieModel.self, from: data)
                    } catch let error {
                        print(Strings.Error.decoding, error)
                    }
                }
            }
        }
        dataTask.resume()

    }
    
    
}
