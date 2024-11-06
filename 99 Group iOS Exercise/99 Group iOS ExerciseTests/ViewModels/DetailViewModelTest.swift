//
//  DetailViewModelTest.swift
//  99 Group iOS ExerciseTests
//
//  Created by Ezra Arya Wijaya on 05/11/24.
//

import XCTest
@testable import _9_Group_iOS_Exercise
import Factory

@MainActor
final class DetailViewModelTest: XCTestCase {
    private var sut: DetailViewModel!
    
    override func setUp() {
        super.setUp()
        Container.shared.reset()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // Test fetching properties details successfully
    func testFetchPropertiesDetail() async {
        // Given
        let mockAPIManager = MockAPIManager()
        
        Container.shared.apiManager.register { mockAPIManager }
        
        sut = DetailViewModel(id: 1)
        
        // When
        await sut.fetchDetails()
        
        // Then
        XCTAssertEqual(sut.property?.projectName, "Mock Project Name", "Properties name should be Mock Project Name")
        XCTAssertTrue(sut.property?.id == 1, "Properties id should be 1")
    }
    
    // Test Valid Properties when opening map
    func testOpenMapWithValidProperty() async throws {
        // Given
        let mockAPIManager = MockAPIManager()
        let mockMapsManager = MockMapsManager()
        
        Container.shared.apiManager.register { mockAPIManager }
        Container.shared.mapsManager.register { mockMapsManager }
        
        sut = DetailViewModel(id: 1)
        
        // When
        await sut.fetchDetails()
        sut.openMap()
        
        // Then
        XCTAssertTrue(mockMapsManager.openInGoogleMapsCalled, "openInGoogleMaps should have been called")
        XCTAssertEqual(mockMapsManager.lastLatitude, 1.0, "Incorrect latitude passed")
        XCTAssertEqual(mockMapsManager.lastLongitude, 1.0, "Incorrect longitude passed")
    }
    
    // Test open map with no property
    func testOpenMapWithNoProperty() async throws {
        // Given
        let mockAPIManager = MockAPIManager()
        let mockMapsManager = MockMapsManager()
        
        Container.shared.apiManager.register { mockAPIManager }
        Container.shared.mapsManager.register { mockMapsManager }
        
        sut = DetailViewModel(id: 1)
        
        sut.openMap()
        
        // Then
        XCTAssertFalse(mockMapsManager.openInGoogleMapsCalled, "openInGoogleMaps should not have been called")
        XCTAssertNil(mockMapsManager.lastLatitude, "Latitude should not have been set")
        XCTAssertNil(mockMapsManager.lastLongitude, "Longitude should not have been set")
    }
    
    // Test fetching properties and open map
    func testFetchPropertyDetailAndOpenMap() async throws {
        // Given
        let mockAPIManager = MockAPIManager()
        let mockMapsManager = MockMapsManager()
        let expectedLat = 1.0
        let expectedLng = 1.0
        
        Container.shared.apiManager.register { mockAPIManager }
        Container.shared.mapsManager.register { mockMapsManager }
        
        let sut = DetailViewModel(id: 1)
        
        // When
        await sut.fetchDetails()
        sut.openMap()
        
        // Then
        XCTAssertNotNil(sut.property, "Property should not be nil")
        XCTAssertTrue(mockMapsManager.openInGoogleMapsCalled, "Map should have been opened")
        XCTAssertEqual(mockMapsManager.lastLatitude, expectedLat, "Incorrect latitude")
        XCTAssertEqual(mockMapsManager.lastLongitude, expectedLng, "Incorrect longitude")
    }
}
