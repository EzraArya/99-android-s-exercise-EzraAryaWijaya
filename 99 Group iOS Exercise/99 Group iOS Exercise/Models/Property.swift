//
//  Property.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//
import Foundation

struct PropertiesResponse: Codable {
    let property: [Property]
}

struct Property: Codable, Identifiable {
    let address: Address
    let attributes: Attributes
    let category: String
    let completedAt: String
    let id: Int
    let photo: String
    let projectName: String
    let tenure: Int
    
    enum CodingKeys: String, CodingKey {
        case address, attributes, category, id, photo, tenure
        case completedAt = "completed_at"
        case projectName = "project_name"
    }
}

struct Address: Codable {
    let district: String
    let streetName: String
    
    enum CodingKeys: String, CodingKey {
        case district
        case streetName = "street_name"
    }
}

struct Attributes: Codable {
    let areaSize: Int
    let bathrooms: Int
    let bedrooms: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case areaSize = "area_size"
        case bathrooms, bedrooms, price
    }
}
