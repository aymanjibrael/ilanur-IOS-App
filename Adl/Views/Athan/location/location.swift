//
//  location.swift
//  Adl
//
//  Created by Abdul Adl on 28.05.2022.
//

import SwiftUI
import Adhan
import MapKit

final class LocationManager: NSObject , ObservableObject , CLLocationManagerDelegate {

    
    private let locationManager2 = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), latitudinalMeters: 0.5, longitudinalMeters: 0.5)

    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert to turn on")
        }
    }
    
     private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
         
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("")
        case .denied:
            print("")
        case .authorizedAlways , .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        @unknown default:
            break
        }
    }
     
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    var prayerTimes: PrayerTimes? {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude:locationManager2.location?.coordinate.latitude ?? 0.0, longitude: locationManager2.location?.coordinate.longitude ?? 0.0)
        
        var params = CalculationMethod.turkey.params
        params.madhab = .shafi
        return PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params)
    }

    func countPrayer() -> Date {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude:locationManager2.location?.coordinate.latitude ?? 0.0, longitude: locationManager2.location?.coordinate.longitude ?? 0.0)
        
        var params = CalculationMethod.turkey.params
        params.madhab = .shafi
        
        let prayerTimes = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params)

        let current = prayerTimes?.currentPrayer()
        let next = prayerTimes?.nextPrayer()
        let countdown = prayerTimes?.time(for: next!)

        return countdown!
    }
    
    func lati() -> Double {
        let latitude = locationManager2.location?.coordinate.latitude ?? 0.0
        return latitude
    }
    
    func longi() -> Double {
        let longitude = locationManager2.location?.coordinate.longitude ?? 0.0

        return longitude
    }
    
}
