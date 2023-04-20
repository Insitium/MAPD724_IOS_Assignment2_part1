//
//  LocationManager.swift
//  MAPD724_Assignment2_part1App.swift


//  Frameworks App - GeoChat App - Created Simple UI
//
//  Created on 2023-03-26.
/*
    Amrik Singh(301296257)
    Hafiz Shaikh(301282061)
    Krisuv Bohara(301274636)
    Manmeen Kaur(301259638)
    Sarthak Vashistha(301245284)
*/
//  Version 1.0.0


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
