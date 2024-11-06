//
//  SearchViewModel.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 02/11/24.
//
import Foundation
import Factory

@MainActor
class SearchViewModel: ObservableObject {
    @Published private(set) var properties: [Property] = []
    
    @Injected(\.apiManager) private var apiManager
    
    func fetchProperties() async {
        do {
            properties = try await apiManager.fetchPropertyList()
        } catch {
            print("Error fetching properties: \(error)")
            
        }
    }
}
