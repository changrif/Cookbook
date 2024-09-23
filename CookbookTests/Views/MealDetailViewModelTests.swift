//
//  MealDetailViewModelTests.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import XCTest
@testable import Cookbook

final class MealDetailViewModelTests: XCTestCase {
    
    func test_initialState() async throws {
        let service = MockMealService()
        let viewModel = MealDetailViewModel("0", service)
        
        XCTAssertEqual(viewModel.state, .loading)
    }

    // MARK: - Load

    @MainActor
    func test_load() async throws {
        let service = MockMealService()
        let viewModel = MealDetailViewModel("0", service)

        await viewModel.load()

        XCTAssertEqual(viewModel.state, .complete(Meal.stub))
    }

    @MainActor
    func test_load_error() async throws {
        let service = MockMealService(mockMeal: { _ in throw StubError() })
        let viewModel = MealDetailViewModel("0", service)
        
        await viewModel.load()
        
        XCTAssertEqual(viewModel.state, .error)
    }
}
