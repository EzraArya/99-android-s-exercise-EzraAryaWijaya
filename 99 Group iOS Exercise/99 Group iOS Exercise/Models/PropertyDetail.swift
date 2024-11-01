//
//  PropertyDetail.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

struct PropertyDetailResponse: Codable {
    let propertyDetail: PropertyDetail
}

struct PropertyDetail: Codable, Identifiable {
    let address: DetailAddress
    let attributes: Attributes
    let description: String
    let id: Int
    let photo: String
    let projectName: String
    let projectDetails: [projectDetails]
    
    enum CodingKeys: String, CodingKey {
        case address, attributes, description, id, photo
        case projectName = "project_name"
        case projectDetails = "project_details"
    }
}

struct DetailAddress: Codable {
    let mapCoordinates: MapCoordinates
    let subtitle: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case mapCoordinates = "map_coordinates"
        case subtitle, title
    }
}

struct MapCoordinates: Codable {
    let lat: Double
    let lng: Double
}


struct projectDetails: Codable {
    let label: String
    let text: String
}

