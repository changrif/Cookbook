//
//  MealServiceTests.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import XCTest
@testable import Cookbook

final class MealServiceTests: XCTestCase {
    
    // MARK: - Meal List
    
    func test_mealList() async throws {
        var urlRequest: URLRequest?
        let client = MockNetworkClient {
            urlRequest = $0
            return (
                Data(
                """
                {
                    "meals": [
                        {
                            "idMeal": "1",
                            "strMeal": "Cherry Pie"
                        },
                        {
                            "idMeal": "2",
                            "strMeal": "Apple Pie"
                        },
                    ]
                }
                """.utf8),
                URLResponse()
            )
        }
        let service = MealService(client: client)
        
        let actual = try await service.mealList(for: "Dessert")
        
        // Validate URL Request
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(urlRequest?.url, URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        XCTAssertEqual(urlRequest?.cachePolicy, .returnCacheDataElseLoad)

        // Validate Model (in sorted order)
        XCTAssertEqual(actual, [
            MealListItem(id: "2", name: "Apple Pie"),
            MealListItem(id: "1", name: "Cherry Pie"),
        ])
    }
    
    func test_mealList_failedToFetchData() async throws {
        let client = MockNetworkClient { _ in throw StubError() }
        let service = MealService(client: client)
        
        // Validate Error
        do {
            let _ = try await service.mealList(for: "")
            XCTFail("MealService.mealList was expected to throw MealServiceError.failedToFetchData")
        } catch {
            let error = error as? MealService.MealServiceError
            XCTAssertEqual(error, .failedToFetchData)
        }
    }
    
    func test_mealList_failedToDecodeResponse() async throws {
        let client = MockNetworkClient { _ in (Data(), HTTPURLResponse()) }
        let service = MealService(client: client)
        
        // Validate Error
        do {
            let _ = try await service.mealList(for: "")
            XCTFail("MealService.mealList was expected to throw MealServiceError.failedToDecodeResponse")
        } catch {
            let error = error as? MealService.MealServiceError
            XCTAssertEqual(error, .failedToDecodeResponse)
        }
    }
    
    // MARK: - Meal
    
    func test_meal() async throws {
        var urlRequest: URLRequest?
        let client = MockNetworkClient {
            urlRequest = $0
            return (
                Data(
                """
                {
                    "meals": [
                        {
                            "idMeal": "0",
                            "strMeal": "meal",
                            "strInstructions": "instructions",
                            "strIngredient1": "ingredient1",
                            "strIngredient2": "ingredient2",
                            "strIngredient3": "ingredient3",
                            "strIngredient4": "ingredient4",
                            "strIngredient5": "ingredient5",
                            "strIngredient6": "",
                            "strIngredient7": "",
                            "strIngredient8": "",
                            "strIngredient9": "",
                            "strIngredient10": "",
                            "strIngredient11": "",
                            "strIngredient12": "",
                            "strIngredient13": "",
                            "strIngredient14": "",
                            "strIngredient15": "",
                            "strIngredient16": "",
                            "strIngredient17": "",
                            "strIngredient18": "",
                            "strIngredient19": "",
                            "strIngredient20": "",
                            "strMeasure1": "measure1",
                            "strMeasure2": "measure2",
                            "strMeasure3": "measure3",
                            "strMeasure4": "measure4",
                            "strMeasure5": "measure5",
                            "strMeasure6": " ",
                            "strMeasure7": " ",
                            "strMeasure8": " ",
                            "strMeasure9": " ",
                            "strMeasure10": " ",
                            "strMeasure11": " ",
                            "strMeasure12": " ",
                            "strMeasure13": " ",
                            "strMeasure14": " ",
                            "strMeasure15": " ",
                            "strMeasure16": " ",
                            "strMeasure17": " ",
                            "strMeasure18": " ",
                            "strMeasure19": " ",
                            "strMeasure20": " "
                        }
                    ]
                }
                """.utf8),
                URLResponse()
            )
        }
        
        let service = MealService(client: client)
        let actual = try await service.meal(from: "0")
        
        // Validate URL Request
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(urlRequest?.url, URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=0")!)
        XCTAssertEqual(urlRequest?.cachePolicy, .returnCacheDataElseLoad)
        
        // Validate Model
        let expected = Meal(
            id: "0",
            name: "meal",
            instructions: "instructions",
            ingredients: [
                .init(name: "ingredient1", measure: "measure1"),
                .init(name: "ingredient2", measure: "measure2"),
                .init(name: "ingredient3", measure: "measure3"),
                .init(name: "ingredient4", measure: "measure4"),
                .init(name: "ingredient5", measure: "measure5")
            ]
        )
        XCTAssertEqual(actual, expected)
    }
    
    func test_meal_failedToFetchData() async throws {
        let client = MockNetworkClient { _ in throw StubError() }
        let service = MealService(client: client)
        
        // Validate Error
        do {
            let _ = try await service.meal(from: "0")
            XCTFail("MealService.meal was expected to throw MealServiceError.failedToFetchData")
        } catch {
            let error = error as? MealService.MealServiceError
            XCTAssertEqual(error, .failedToFetchData)
        }
    }
    
    func test_meal_noData() async throws {
        let client = MockNetworkClient { _ in
            return (
                Data("{\"meals\": []}".utf8),
                URLResponse()
            )
        }
        let service = MealService(client: client)
        
        // Validate Error
        do {
            let _ = try await service.meal(from: "0")
            XCTFail("MealService.meal was expected to throw MealServiceError.noData")
        } catch {
            let error = error as? MealService.MealServiceError
            XCTAssertEqual(error, .noData)
        }
    }
    
    func test_meal_failedToDecodeResponse() async throws {
        let client = MockNetworkClient { _ in (Data(), URLResponse()) }

        let service = MealService(client: client)
        
        // Validate Error
        do {
            let _ = try await service.meal(from: "0")
            XCTFail("MealService.meal was expected to throw MealServiceError.failedToDecodeResponse")
        } catch {
            let error = error as? MealService.MealServiceError
            XCTAssertEqual(error, .failedToDecodeResponse)
        }
    }
}
