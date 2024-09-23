//
//  MealCategory.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation

struct MealCategory {
    let id = UUID()
    let name: String
}

extension MealCategory {
    static let dessert = MealCategory(name: "Dessert")
}
