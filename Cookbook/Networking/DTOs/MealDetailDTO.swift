//
//  MealDetailDTO.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

struct MealDetailsDTO: Decodable {
    let meals: [MealDetailDTO]
}

struct MealDetailDTO: Decodable {
    let id: String
    let name: String
    let instructions: String
    var ingredients: [MealIngredientDTO]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        
        case strIngredient1,
             strIngredient2,
             strIngredient3,
             strIngredient4,
             strIngredient5,
             strIngredient6,
             strIngredient7,
             strIngredient8,
             strIngredient9,
             strIngredient10,
             strIngredient11,
             strIngredient12,
             strIngredient13,
             strIngredient14,
             strIngredient15,
             strIngredient16,
             strIngredient17,
             strIngredient18,
             strIngredient19,
             strIngredient20
        
        case strMeasure1,
             strMeasure2,
             strMeasure3,
             strMeasure4,
             strMeasure5,
             strMeasure6,
             strMeasure7,
             strMeasure8,
             strMeasure9,
             strMeasure10,
             strMeasure11,
             strMeasure12,
             strMeasure13,
             strMeasure14,
             strMeasure15,
             strMeasure16,
             strMeasure17,
             strMeasure18,
             strMeasure19,
             strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        instructions = try values.decode(String.self, forKey: .instructions)
        
        ingredients = []
        for i in 1...20 {
            guard let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)"),
                  let name = try? values.decode(String.self, forKey: ingredientKey),
                  !name.isEmpty,
                  let measureKey = CodingKeys(rawValue: "strMeasure\(i)"),
                  let measure = try? values.decode(String.self, forKey: measureKey)
            else {
                continue
            }
            ingredients.append(.init(name: name, measure: measure))
        }
    }
}

extension MealDetailDTO {
    struct MealIngredientDTO: Decodable {
        let name: String
        let measure: String
    }
}
