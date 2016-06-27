//
//  EarthquakeDataProvider.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 27.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EarthquakeDataProvider : NSObject{
    
    func getEarthquakeData(success: ((Array<Earthquake>!) -> Void)!,fail: ((NSError!) -> Void)!) -> AnyObject{
        
        return Alamofire.request(.GET,"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojson").responseJSON(completionHandler: {(response) -> Void in
            
            let json  = JSON(data: response.data!)
            let features = json["features"].arrayValue
            var currentEarthquakes = Array<Earthquake>()
            for feature in features{
                currentEarthquakes.append(Earthquake(json: feature))
            }
            success(currentEarthquakes);
        })
    }
}