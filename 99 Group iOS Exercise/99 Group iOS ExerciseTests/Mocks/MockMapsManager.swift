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
    var openMapsCalled = false
    var lastLatitude: Double?
    var lastLongitude: Double?
    var shouldAllowGoogleMaps = true
    var shouldAllowAppleMaps = true

    func openMaps(latitude: Double, longitude: Double) {
        openMapsCalled = true
        lastLatitude = latitude
        lastLongitude = longitude
    }
    
    func canOpenAppleMaps() -> Bool {
        return shouldAllowAppleMaps
    }
    
    func canOpenGoogleMaps() -> Bool {
        return shouldAllowGoogleMaps
    }
}