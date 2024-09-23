//
//  StubMeal.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation
@testable import Cookbook

extension Meal {
    static let stub: Meal = .init(
        id: "0",
        name: "name",
        instructions: "instructions",
        ingredients: [
            .init(name: "ingredient1", measure: "measure1"),
            .init(name: "ingredient2", measure: "measure2")
        ]
    )
}
