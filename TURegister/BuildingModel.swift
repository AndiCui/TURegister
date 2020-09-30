//
//  BuildingModel.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import Foundation

class BuildingModel {
    var buildings: [Building]?

    init() {
        DispatchQueue.global(qos: .userInitiated).async {
            let decoder = JSONDecoder()
            do {
                if let path = Bundle.main.path(forResource: "TUEligibleBuildings", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                    self.buildings = try decoder.decode([Building].self, from: data)
                } else {
                    self.buildings = nil
                }
            } catch {
                self.buildings = nil
            }
        }

    }
}
