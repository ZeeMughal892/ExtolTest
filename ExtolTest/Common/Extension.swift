//
//  Extension.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import UIKit

extension UIImage {
    
    func convertUrlToImage(endpoint: String) -> UIImage {
        let data: Data
        do {
            let url = ApiUrls.imageUrl + endpoint
            data = try Data(contentsOf: url.convertStringToUrl(str: url)!)
            return UIImage(data: data) ?? UIImage()
        } catch {
            return UIImage()
        }
    }
}

extension String {
    
    func convertStringToUrl(str: String) -> URL? {
        return URL(string: str)
    }
}
