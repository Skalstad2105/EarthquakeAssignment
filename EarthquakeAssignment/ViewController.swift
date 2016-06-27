//
//  ViewController.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 26.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var mag = [Double]()
    var places = [String]()
    var lat = [Double]()
    var long = [Double]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadJSON();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ViewControllerTableViewCell
    
        let mag = String(self.mag[indexPath.row])
        cell.magLabel.text = mag
        cell.placeLabel.text = self.places[indexPath.row]
        
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("details", sender: indexPath)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "details"{
            
           let destination = segue.destinationViewController as! DetailsViewController
            let selectedIndex = sender as! NSIndexPath
            let index = selectedIndex.row
        
            destination.mag = self.mag[index]
            destination.place = self.places[index]
            destination.lat = self.lat[index]
            destination.long = self.long[index]
            
        }
        
    }

    func downloadJSON()
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
       AppDelegate().earthquakeDataProvider().getEarthquakeData(self._buildEarthquakes, fail: self._handleNetworkError)
        })
    }
    
    private func _buildEarthquakes(earthQuakes: Array<Earthquake>!) {
        
       
       for quake in earthQuakes
       {
        
            self.mag.append(quake.mag)
            self.places.append(quake.place)
            self.long.append(quake.longitude)
            self.lat.append(quake.latitude)
       }
        
        self.tableView.reloadData()
        print(self.mag.sort(>))
    }
    
    private func _handleNetworkError(error: NSError!) {
        print(error)
    }
    
}

