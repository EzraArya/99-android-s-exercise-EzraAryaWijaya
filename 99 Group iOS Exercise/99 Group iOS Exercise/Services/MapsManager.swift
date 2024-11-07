//
//  MapsManager.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 04/11/24.
//

import SwiftUI
import Factory
import MapKit
protocol MapsManagerProtocol {
    func openMaps(latitude: Double, longitude: Double)
}

class MapsManager: MapsManagerProtocol {
    private let application: UIApplication
    
    init(application: UIApplication = .shared) {
        self.application = application
    }
    
    func openMaps(latitude: Double, longitude: Double) {
        if canOpenAppleMaps() {
            openInAppleMaps(latitude: latitude, longitude: longitude)
        } else if canOpenGoogleMaps() {
            openInGoogleMaps(latitude: latitude, longitude: longitude)
        } else {
            openInWebBrowser(latitude: latitude, longitude: longitude)
        }
    }
    
    private func canOpenAppleMaps() -> Bool {
        guard let url = URL(string: "maps://") else { return false }
        return application.canOpenURL(url)
    }
    
    private func canOpenGoogleMaps() -> Bool {
        guard let url = URL(string: "comgooglemaps://") else { return false }
        return application.canOpenURL(url)
    }
    
    private func openInAppleMaps(latitude: Double, longitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsMapCenterKey: coordinate])
    }

    private func openInGoogleMaps(latitude: Double, longitude: Double) {
        let googleMapsURL = "comgooglemaps://?center=\(latitude),\(longitude)&zoom=14"
         
        if let url = URL(string: googleMapsURL) {
            application.open(url, options: [:], completionHandler: nil)
        } else {
            openInWebBrowser(latitude: latitude, longitude: longitude)
        }
    }
     
    private func openInWebBrowser(latitude: Double, longitude: Double) {
        let webURL = "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)"
        if let url = URL(string: webURL) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
}
