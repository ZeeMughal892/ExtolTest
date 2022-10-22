//
//  MovieParamObject.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import Foundation

class MovieParamObject: NSObject {
    
    var api_key: String
    var language: String?
    var page: Int?

    init(api_key: String, language: String? = "", page: Int? = nil) {
        self.api_key = api_key
        self.language = language
        self.page = page
    }
}
