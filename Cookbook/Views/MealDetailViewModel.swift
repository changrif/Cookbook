//
//  MealDetailViewModel.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/21/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    enum LoadingState: Equatable {
        case loading
        case complete(Meal)
        case error
    }
    
    @Published var state: LoadingState = .loading
    
    let mealId: String
    let service: MealProviding
    
    init(
        _ mealId: String,
        _ service: MealProviding = MealService()
    ) {
        self.mealId = mealId
        self.service = service
    }
    
    @MainActor
    func load() async {
        state = .loading
        do {
            state = .complete(
                try await service.meal(from: mealId)
            )
        } catch {
            state = .error
        }
    }
}
