//
//  MealDTO.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

struct MealsDTO: Decodable {
    let meals: [MealDTO]
}

struct MealDTO: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
    }
}
