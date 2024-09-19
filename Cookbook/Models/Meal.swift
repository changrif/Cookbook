//
//  Meal.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

struct Meal {
    let id: String
    let name: String
    let instructions: String
    let ingredients: [Ingredient]
    
    struct Ingredient: Identifiable {
        let id = UUID()
        let name: String
        let measure: String
    }
}
