//
//  DetailViewModel.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 02/11/24.
//
import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    @Published var property: PropertyDetail?
    let id: Int
    
    private let apiManager: APIManager
    
    init(id: Int, apiManager: APIManager = .shared) {
        self.id = id
        self.apiManager = apiManager
    }
    
    func fetchDetails() async {
        do {
            property = try await apiManager.fetchPropertyDetail(id: id)
        } catch {
            print("Error fetching properties: \(error)")
        }
        
    }
}
