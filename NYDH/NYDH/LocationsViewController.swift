//
//  LocationsViewController.swift
//  NYDH
//
//  Created by Marcel Chaucer on 8/25/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

struct LocationAddress {
    var locationStreet: String!
    var locationBorough: String!
    var phoneNumber: String!
}


class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var locationInfo: [String: [String: String]] =
        ["308 Graham Avenue" : ["borough": "Brooklyn, New York 11211", "phoneNumber": "(718) 599-7500"],
         "2202 Grand Concourse" : ["borough": "Bronx, New York 10457", "phoneNumber": "(718) 365-6389"],
         "2015 Grand Concourse" : ["borough": "Bronx, New York 10457", "phoneNumber": "(917) 801-4777"],
         "660 Westchester Avenue" : ["borough": "Bronx, New York 10457", "phoneNumber": "(718) 292-6946"],
         "1550 University Avenue" : ["borough": "Bronx, New York 10452", "phoneNumber": "(917) 893-8777"],
         "2475 Grand Concourse" : ["borough": "Bronx, New York 10465", "phoneNumber": "(718) 329-2929"],
         "2445 Arthur Avenue" : ["borough": "Bronx, New York 10458", "phoneNumber": "COMING SOON!"]
    ]
    
    var openLocations = [LocationAddress]()
    var futureLocations = [LocationAddress]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (key, value) in locationInfo {
            
            if value["phoneNumber"] != "COMING SOON!" {
                openLocations.append(LocationAddress(locationStreet: key, locationBorough: value["borough"], phoneNumber: value["phoneNumber"] ))
            } else {
                futureLocations.append(LocationAddress(locationStreet: key, locationBorough: value["borough"], phoneNumber: value["phoneNumber"]))
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return openLocations.count
        case 1:
            return futureLocations.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Open Locations"
        case 1:
            return "Not Just Yet"
        default:
            break
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        
        switch indexPath.section {
            
        case 0:
            let location = openLocations[indexPath.row]
            cell.streetLabel.text = location.locationStreet!
            cell.boroughLabel.text = location.locationBorough!
            cell.phoneNumberLabel.text = location.phoneNumber!
            
        case 1:
            
            let location = futureLocations[indexPath.row]
            cell.streetLabel.text = location.locationStreet!
            cell.boroughLabel.text = location.locationBorough!
            cell.phoneNumberLabel.text = location.phoneNumber!
        default:
            break
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            //Sets up address string for URL
            let locationStreet = openLocations[indexPath.row].locationStreet!
            let locationBorough = openLocations[indexPath.row].locationBorough!
            let location = locationStreet + " "  + locationBorough
            
            //Makes string play nicely with URL
            let address = location.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let appleMapsURL = URL(string: "http://maps.apple.com/?q=\(address!)")!
            let googleMapsURL = URL(string: "https://www.google.com/maps/search/?api=1&query=\(address!)")!
            print(appleMapsURL)
            
            UIApplication.shared.open(googleMapsURL, options: [:], completionHandler: nil)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        case 1:
            let alert = UIAlertController(title: "Alert", message: "That Place Don't Exist Yet Idiot", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Whatevz", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
            
        default:
            break
        }
    }
    
}
