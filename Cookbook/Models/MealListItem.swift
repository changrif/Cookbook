//
//  MealListItem.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

struct MealListItem: Comparable, Identifiable, Equatable {
    let id: String
    let name: String
    
    static func < (
        lhs: MealListItem,
        rhs: MealListItem
    ) -> Bool {
        lhs.name < rhs.name
    }
}

extension MealListItem {
    init(from dto: MealDTO) {
        id = dto.id
        name = dto.name
    }
}
