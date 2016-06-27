//
//  ViewController.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 26.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var mag = [String]()
    var places = [String]()
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.places[indexPath.row]
        
        return cell
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
       }
        
        self.tableView.reloadData()
    }
    
    private func _handleNetworkError(error: NSError!) {
        print(error)
    }
    
}

