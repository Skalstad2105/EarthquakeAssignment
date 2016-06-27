//
//  Earthquake.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 27.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import Foundation
import SwiftyJSON

class Earthquake {
    
    private let json: JSON
    private let detail: String
    let latitude: Double
    let longitude: Double
    private let timeInSeconds: Double
    let mag: Double
    let place: String
    
    init(json: JSON) {
        self.json = json
        self.detail = json["properties"]["detail"].stringValue
        self.latitude = json["geometry"]["coordinates"][1].doubleValue
        self.longitude = json["geometry"]["coordinates"][0].doubleValue
        self.mag = json["properties"]["mag"].doubleValue
        self.place = json["properties"]["place"].stringValue
        self.timeInSeconds = json["properties"]["time"].doubleValue / 1000
    }
}