//
//  BuildingListViewModel.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import Foundation
import Combine
import CoreLocation

class BuildingListViewModel: NSObject, ObservableObject {
    let model: BuildingModel = BuildingModel()
    var buildings: [Building]? {
            model.buildings
    }

    @Published var coordinate: CLLocationCoordinate2D?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        if locationManager.authorizationStatus == CLAuthorizationStatus.notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func getSortedBuildings() -> [Building]? {
        if coordinate != nil {
            return buildings?.sorted(coordinate: coordinate!)
        } else {
            return buildings
        }
    }
}

extension Building {
    func distanceTo(coordinate: CLLocationCoordinate2D) -> Double {
        return CLLocation(latitude: self.latitude, longitude: self.longitude).distance(from: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
}

extension Array where Element == Building {
    func sorted(coordinate: CLLocationCoordinate2D) -> [Building] {
        return self.sorted {
            $0.distanceTo(coordinate: coordinate) < $1.distanceTo(coordinate: coordinate)
        }
    }
}

extension BuildingListViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        coordinate = location.coordinate
    }
}
