//
//  BuildingButtonView.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import SwiftUI
import CoreLocation

struct BuildingButtonView: View {
    var building: Building
    var distanceInMeters: Double?

    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text(building.buildingCode)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(building.secondaryName)
                        .multilineTextAlignment(.trailing)
                        .padding(.top, 4.0)
                    if distanceInMeters != nil {
                        Text(String(format: "%.0fm", distanceInMeters!))
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct BuildingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingButtonView(building:
                            Building(buildingCode: "AA", city: "Wien", houseNumber: "13",
                                     id: 605, name: "Karlsplatz 13",
                                     secondaryName: "Hauptgebäude AA-AI",
                                     street: "Karlsplatz", zipCode: "1040",
                                     longitude: 48.198921, latitude: 16.369913),
                           distanceInMeters: 20
        )
    }
}
