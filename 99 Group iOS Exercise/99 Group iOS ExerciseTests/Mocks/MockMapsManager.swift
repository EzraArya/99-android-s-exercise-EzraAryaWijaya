//
//  MockMapsManager.swift
//  99 Group iOS ExerciseTests
//
//  Created by Ezra Arya Wijaya on 05/11/24.
//

import XCTest
@testable import _9_Group_iOS_Exercise
import Factory

class MockMapsManager: MapsManagerProtocol {
    var openInGoogleMapsCalled = false
    var lastLatitude: Double?
    var lastLongitude: Double?
    var shouldAllowGoogleMaps = true
    
    func openInGoogleMaps(latitude: Double, longitude: Double) {
        openInGoogleMapsCalled = true
        lastLatitude = latitude
        lastLongitude = longitude
    }
    
    func canOpenGoogleMaps() -> Bool {
        return shouldAllowGoogleMaps
    }
}
