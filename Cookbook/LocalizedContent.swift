//
//  LocalizedContent.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation

enum LocalizedContent {
    enum Common {
        /// Something went wrong
        static let somethingWentWrong = String(
            localized: "common.text.something-went-wrong",
            defaultValue: "Something went wrong.",
            comment: "Text indicating a failable asyncronous action threw an error."
        )
    }
    
    enum ContentView {
        /// Choose a recipe
        static let chooseARecipe = String(
            localized: "content-view.text.choose-a-recipe",
            defaultValue: "Choose a recipe",
            comment: "Empty state text prompting users to choose an initial recipe to view."
        )
    }
    
    enum MealDetail {
        /// Ingredients
        static let ingredients = String(
            localized: "meal-detail.text.ingredients",
            defaultValue: "Ingredients",
            comment: "Heading text for a meal's ingredients."
        )
    }
}
