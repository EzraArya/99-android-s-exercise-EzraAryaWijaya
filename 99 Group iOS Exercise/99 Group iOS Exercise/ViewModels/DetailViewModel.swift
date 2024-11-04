//
//  DetailViewModel.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 02/11/24.
//
import Foundation
import Factory

@MainActor
class DetailViewModel: ObservableObject {
    @Published var property: PropertyDetail?
    let id: Int
    
    @Injected(\.apiManager) private var apiManager
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchDetails() async {
        do {
            property = try await apiManager.fetchPropertyDetail(id: id)
        } catch {
            print("Error fetching properties: \(error)")
        }
        
    }
}
