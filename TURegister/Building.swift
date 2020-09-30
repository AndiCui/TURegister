//
//  Building.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import Foundation

struct Building: Identifiable, Codable {
    var buildingCode: String
    var city: String
    var houseNumber: String
    var id: Int
    var name: String
    var secondaryName: String
    var street: String
    var zipCode: String
    var longitude: Double
    var latitude: Double
}
