//
//  ApiManager.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    private let baseURL = URL(string: "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/")!
    private let decoder = JSONDecoder()
    
    func fetchPropertyList() async throws -> [Property] {
        let endpoint = baseURL.appendingPathComponent("listings.json")
        return try await fetchData(from: endpoint)
    }
    
    func fetchPropertyDetail(id: Int) async throws -> PropertyDetail {
        let endpoint = baseURL.appendingPathComponent("details/\(id).json")
        return try await fetchData(from: endpoint)
    }
    
    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
