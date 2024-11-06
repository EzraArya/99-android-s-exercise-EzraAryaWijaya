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
    let lat: Double
    let lng: Double
    
    @Injected(\.apiManager) private var apiManager
    @Injected(\.mapsManager) private var mapsManager
    
    init(id: Int, lat: Double = 0, lng: Double = 0) {
        self.id = id
        self.lat = lat
        self.lng = lng
    }
    
    func fetchDetails() async {
        do {
            property = try await apiManager.fetchPropertyDetail(id: id)
        } catch {
            print("Error fetching properties: \(error)")
        }
    }
    
    func openMap() {
        guard let property = property else { return }

        mapsManager.openMaps(latitude: property.address.mapCoordinates.lat, longitude: property.address.mapCoordinates.lng)
    }
}
