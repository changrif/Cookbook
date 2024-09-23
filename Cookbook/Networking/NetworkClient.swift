//
//  NetworkClient.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

protocol NetworkClient {
    func fetchData(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkClient {
    func fetchData(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request)
    }
}
