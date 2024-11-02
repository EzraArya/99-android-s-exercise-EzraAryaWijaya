//
//  PropertyDetail.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

struct PropertyDetail: Codable, Identifiable {
    let address: DetailAddress
    let attributes: Attributes
    let description: String
    let id: Int
    let photo: String
    let projectName: String
    let propertyDetails: [propertyDetails]
    
    enum CodingKeys: String, CodingKey {
        case address, attributes, description, id, photo
        case projectName = "project_name"
        case propertyDetails = "property_details"
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


struct propertyDetails: Codable {
    let label: String
    let text: String
}

