//
//  MealListViewModelTests.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import XCTest
@testable import Cookbook

final class MealListViewModelTests: XCTestCase {
    
    func test_initialState() async throws {
        let category = MealCategory(name: "Dessert")
        let service = MockMealService()
        let viewModel = MealListViewModel(category, service)
        
        XCTAssertEqual(viewModel.state, .loading)
    }

    // MARK: - Load
    
    func test_load() async throws {
        let category = MealCategory(name: "Dessert")
        let service = MockMealService()
        let viewModel = MealListViewModel(category, service)
        
        await viewModel.load()
        
        XCTAssertEqual(viewModel.state, .complete([.stub]))
    }
    
    func test_load_error() async throws {
        let category = MealCategory(name: "Dessert")
        let service = MockMealService(mockMealList: { _ in throw StubError() })
        let viewModel = MealListViewModel(category, service)
        
        await viewModel.load()
        
        XCTAssertEqual(viewModel.state, .error)
    }
}
