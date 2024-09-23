//
//  MockMealService.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation
@testable import Cookbook

struct MockMealService: MealProviding {
    let mockMealList: (@Sendable (String) throws -> [Cookbook.MealListItem])?
    let mockMeal: (@Sendable (String) throws -> Cookbook.Meal)?

    init(
        mockMealList: (@Sendable (String) throws -> [Cookbook.MealListItem])? = nil,
        mockMeal: (@Sendable (String) throws -> Cookbook.Meal)? = nil
    ) {
        self.mockMealList = mockMealList
        self.mockMeal = mockMeal
    }
    
    func mealList(
        for category: String
    ) async throws -> [Cookbook.MealListItem] {
        try mockMealList?(category) ?? [.stub]
    }
    
    func meal(
        from id: String
    ) async throws -> Cookbook.Meal {
        try mockMeal?(id) ?? .stub
    }
}
