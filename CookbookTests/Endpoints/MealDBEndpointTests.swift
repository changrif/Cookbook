//
//  MealDBEndpointTests.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import XCTest
@testable import Cookbook

final class MealDBEndpointTests: XCTestCase {
    
    // MARK: - URL
    
    func test_filter_url() async throws {
        let endpoint = MealDBEndpoint.filter(category: "Dessert")
        
        let expected = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        XCTAssertEqual(endpoint.url, expected)
    }
    
    func test_lookup_url() async throws {
        let endpoint = MealDBEndpoint.lookup(mealId: "0")
        
        let expected = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=0")
        XCTAssertEqual(endpoint.url, expected)
    }
}
