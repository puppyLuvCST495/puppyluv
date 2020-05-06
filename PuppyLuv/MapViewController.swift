//
//  MapViewController.swift
//  PuppyLuv
//
//  Created by Rosario on 4/26/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import MapKit
import Parse
import AlamofireImage

class MapViewController: UIViewController, MKMapViewDelegate {
  @IBOutlet weak var mapView: MKMapView!
  
 var shelters = [PFObject]()

  override func viewDidAppear(_ animated: Bool) {
        
    super.viewDidAppear(animated)
    
    let shelterResults = PFQuery(className: "Location")
    
    shelterResults.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
           if let error = error {
               // Log details of the failure
               print(error.localizedDescription)
           } else if let objects = objects {
               // The find succeeded.
               print("Successfully retrieved \(objects.count) pins.")
    
               self.shelters = objects
               self.add_Annotations()
    
           }
       }
    
    mapView.delegate = self
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  func add_Annotations(){
    var annotations = [MKPointAnnotation]()
    for shelter in shelters{
      let annotation = MKPointAnnotation()
      annotation.title = shelter["name"] as? String
      annotation.coordinate = CLLocationCoordinate2D(latitude: shelter["lat"] as! CLLocationDegrees, longitude: (shelter["long"] as? CLLocationDegrees)!)
      annotations.append(annotation)
       // mapView.addAnnotation(annotation)
    }
    mapView.showAnnotations(annotations,animated: true)
  }

}

