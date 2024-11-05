//
//  Dependencies.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 04/11/24.
//

import Factory

extension Container {
    var apiManager: Factory<APIManagerProtocol> {
        self { APIManager() }
            .singleton
    }
    
    var mapsManager: Factory<MapsManagerProtocol> {
        self { MapsManager() }
            .singleton
    }
}
