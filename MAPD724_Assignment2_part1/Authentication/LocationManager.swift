//
//  LocationManager.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-04-19.
//

import Foundation
import CoreLocation


class LocationManager : NSObject, ObservableObject,CLLocationManagerDelegate {
   var locationManager = CLLocationManager()
    let address = CLGeocoder.init()


   override init() {
      super.init()
      locationManager.delegate = self
   }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("Not Denied Foreven :(")
            locationManager.requestLocation()
            break
            
        case .restricted, .denied:
            print("Denied Foreven :(")
            break
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    

}
