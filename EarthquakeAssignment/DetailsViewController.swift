//
//  DetailsViewController.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 27.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place: String!
    var mag: Double!
    var lat: Double!
    var long: Double!
    
    @IBOutlet weak var placesLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesLabel.text = place
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
