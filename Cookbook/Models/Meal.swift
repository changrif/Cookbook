//
//  Meal.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

struct Meal: Equatable {
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

extension Meal {
    init(from dto: MealDetailDTO) {
        id = dto.id
        name = dto.name
        instructions = dto.instructions
        ingredients = dto.ingredients.map(Ingredient.init)
    }
}

extension Meal.Ingredient {
    init(from dto: MealDetailDTO.MealIngredientDTO) {
        name = dto.name
        measure = dto.measure
    }
}

extension Meal.Ingredient: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name &&
        lhs.measure == rhs.measure
    }
}
