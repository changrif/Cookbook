//
//  MealListViewModel.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/21/24.
//

import Foundation

class MealListViewModel: ObservableObject {
    enum LoadingState: Equatable {
        case loading
        case complete([MealListItem])
        case error
    }
    
    @Published var state: LoadingState = .loading
    
    let category: MealCategory
    let service: MealProviding
    
    init(
        _ category: MealCategory,
        _ service: MealProviding = MealService()
    ) {
        self.category = category
        self.service = service
    }
    
    @MainActor
    func load() async {
        state = .loading
        do {
            #if DEBUG
            guard !isPreview else {
                state = .complete(.preview)
                return
            }
            #endif
            
            let list = try await service.mealList(for: category.name)
            state = .complete(list)
        } catch {
            state = .error
        }
    }
}
