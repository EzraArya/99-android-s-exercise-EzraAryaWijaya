//
//  SearchViewModelTest.swift
//  99 Group iOS ExerciseTests
//
//  Created by Ezra Arya Wijaya on 05/11/24.
//

import XCTest
@testable import _9_Group_iOS_Exercise
import Factory

@MainActor
class SearchViewModelTest: XCTestCase {
    private var sut: SearchViewModel!
    
    override func setUp() {
        super.setUp()
        Container.shared.reset()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // Test fetching properties successfully
    func testFetchPropertiesSuccess() async {
        // Given
        let mockAPIManager = MockAPIManager()
        Container.shared.apiManager.register { mockAPIManager }
        sut = SearchViewModel()
        
        // When
        await sut.fetchProperties()
        
        // Then
        XCTAssertFalse(sut.properties.isEmpty, "Properties list should not be empty on success")
        XCTAssertEqual(sut.properties.count, 1, "There should be 1 property in the list")
        XCTAssertEqual(sut.properties.first?.projectName, "Mock Project Name", "The first property's projectName should match mock data")
    }
    
    func testFetchPropertiesFailed() async {
        // Given
        let mockAPIManager = MockAPIManager()
        Container.shared.apiManager.register { mockAPIManager }
        sut = SearchViewModel()
        
        // When
        
        // Then
        XCTAssertTrue(sut.properties.isEmpty, "Properties list should be empty on failure")
        XCTAssertEqual(sut.properties.count, 0, "There should be 0 property in the list")
    }

}
