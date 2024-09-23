//
//  MockNetworkClient.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation
@testable import Cookbook

final actor MockNetworkClient: NetworkClient {

    let mockFetchData: @Sendable () throws -> (Data, URLResponse)
    var urlRequest: URLRequest?

    init(mockFetchData: @escaping @Sendable () throws -> (Data, URLResponse), urlRequest: URLRequest? = nil) {
        self.mockFetchData = mockFetchData
        self.urlRequest = urlRequest
    }

    func fetchData(for request: URLRequest) async throws -> (Data, URLResponse) {
        urlRequest = request
        return try mockFetchData()
    }
}
