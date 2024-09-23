//
//  MealService.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/19/24.
//

import Foundation

protocol MealProviding: Sendable {
    func mealList(for category: String) async throws -> [MealListItem]
    func meal(from id: String) async throws -> Meal
}

struct MealService: MealProviding {
    
    let client: NetworkClient
    
    init(client: NetworkClient = URLSession.shared) {
        self.client = client
    }
    
    func mealList(for category: String) async throws -> [MealListItem] {
        guard let url = MealDBEndpoint.filter(category: category).url else {
            throw MealServiceError.invalidURL
        }

        let data = try await fetchData(for: url)
        let dto: MealsDTO = try decode(data)
        return dto.meals.map(MealListItem.init).sorted()
    }
    
    func meal(from id: String) async throws -> Meal {
        guard let url = MealDBEndpoint.lookup(mealId: id).url else {
            throw MealServiceError.invalidURL
        }

        let data = try await fetchData(for: url)
        let dto: MealDetailsDTO = try decode(data)
        guard let mealDTO = dto.meals.first else {
            throw MealServiceError.noData
        }
        return Meal(from: mealDTO)
    }
    
    private func fetchData(for url: URL) async throws -> Data {
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await client.fetchData(for: request)
            return data
        } catch {
            throw MealServiceError.failedToFetchData
        }
    }
    
    private func decode<Response: Decodable>(
        _ data: Data
    ) throws -> Response {
        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw MealServiceError.failedToDecodeResponse
        }
    }
}

extension MealService {
    enum MealServiceError: Error {
        case invalidURL
        case failedToFetchData
        case failedToDecodeResponse
        case noData
    }
}
