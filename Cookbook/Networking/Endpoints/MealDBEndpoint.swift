//
//  MealDBEndpoint.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/20/24.
//

import Foundation

enum MealDBEndpoint {
    case filter(category: String)
    case lookup(mealId: String)
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "themealdb.com"
        urlComponents.path = "/api/json/v1/1"

        switch self {
        case let .filter(category):
            urlComponents.path += "/filter.php"
            urlComponents.queryItems = [
                URLQueryItem(name: "c", value: category)
            ]
        case let .lookup(mealId):
            urlComponents.path += "/lookup.php"
            urlComponents.queryItems = [
                URLQueryItem(name: "i", value: mealId)
            ]
        }
        
        return urlComponents.url
    }
}
