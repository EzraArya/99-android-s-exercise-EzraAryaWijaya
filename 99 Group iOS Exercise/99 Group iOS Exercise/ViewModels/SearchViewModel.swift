//
//  SearchViewModel.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 02/11/24.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published private(set) var properties: [Property] = []
    
    private let apiManager: APIManager
       
    init(apiManager: APIManager = .shared) {
        self.apiManager = apiManager
    }
    
    func fetchProperties() async {
        Task {
            do {
                properties = try await apiManager.fetchPropertyList()
            } catch {
                print("Error fetching properties: \(error)")
            }
        }
    }
}
