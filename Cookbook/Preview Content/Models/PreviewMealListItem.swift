//
//  PreviewMealListItem.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

extension MealListItem {
    static var preview: Self {
        [MealListItem].preview.first!
    }
}

extension [MealListItem] {
    static var preview: Self {
        [
            .init(id: "0", name: "Bakewell tart"),
            .init(id: "1", name: "Carrot Cake")
        ]
    }
}
