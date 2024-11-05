//
//  MapsManager.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 04/11/24.
//

import SwiftUI
import Factory

protocol MapsManagerProtocol {
    func openInGoogleMaps(latitude: Double, longitude: Double)
    func canOpenGoogleMaps() -> Bool
    }

class MapsManager: MapsManagerProtocol {
    private let application: UIApplication
    
    init(application: UIApplication = .shared) {
        self.application = application
    }

    func openInGoogleMaps(latitude: Double, longitude: Double) {
         let googleMapsURL = "comgooglemaps://?center=\(latitude),\(longitude)&zoom=14"
         
         if canOpenGoogleMaps(),
            let url = URL(string: googleMapsURL) {
             application.open(url, options: [:], completionHandler: nil)
         } else {
             openInWebBrowser(latitude: latitude, longitude: longitude)
         }
     }
     
     func canOpenGoogleMaps() -> Bool {
         guard let url = URL(string: "comgooglemaps://") else { return false }
         return application.canOpenURL(url)
     }
     
     private func openInWebBrowser(latitude: Double, longitude: Double) {
         let webURL = "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)"
         if let url = URL(string: webURL) {
             application.open(url, options: [:], completionHandler: nil)
         }
     }
}
