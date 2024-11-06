//
//  MocksTest.swift
//  99 Group iOS ExerciseTests
//
//  Created by Ezra Arya Wijaya on 05/11/24.
//

import XCTest
@testable import _9_Group_iOS_Exercise
import Factory

class MockAPIManager: APIManagerProtocol {
    var shouldReturnError = false

     func fetchPropertyList() async throws -> [Property] {
         if shouldReturnError {
             throw NSError(domain: "", code: -1, userInfo: nil)
         }
         return [
            Property(
            address: Address(
                district: "Mock District",
                streetName: "Mock Street"),
            attributes: Attributes(
                areaSize: 1,
                bathrooms: 1,
                bedrooms: 1,
                price: 1),
            category: "Mock Category",
            completedAt: "Mock",
            id: 1,
            photo: "https://www.moldexrealty.ph/house-models/",
            projectName: "Mock Project Name",
            tenure: 1)]
     }
     
     func fetchPropertyDetail(id: Int) async throws -> PropertyDetail {
         if shouldReturnError {
             throw NSError(domain: "", code: -1, userInfo: nil)
         }
         return PropertyDetail(
            address: DetailAddress(
                mapCoordinates: MapCoordinates(
                    lat: 1,
                    lng: 1),
                subtitle: "Mock Subtitle",
                title: "Mock Title"),
            attributes: Attributes(
                areaSize: 1,
                bathrooms: 1,
                bedrooms: 1,
                price: 1),
            description: "Mock Description",
            id: 1,
            photo: "https://www.moldexrealty.ph/house-models/",
            projectName: "Mock Project Name",
            propertyDetails: [
                propertyDetails(
                    label: "Mock Label",
                    text: "Mock Text")])
     }
    
}
