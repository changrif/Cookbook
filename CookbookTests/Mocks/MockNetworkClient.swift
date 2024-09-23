//
//  MockNetworkClient.swift
//  CookbookTests
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation
@testable import Cookbook

struct MockNetworkClient: NetworkClient {
    
    let mockFetchData: (URLRequest) throws -> (Data, URLResponse)
    
    func fetchData(for request: URLRequest) async throws -> (Data, URLResponse) {
        try mockFetchData(request)
    }
}
