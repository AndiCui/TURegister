//
//  ContentView.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import SwiftUI

struct BuildingListView: View {
    @ObservedObject var viewModel = BuildingListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if let buildings = viewModel.getSortedBuildings() {
                    List(buildings) {building in
//                            NavigationLink(destination: EmptyView()) {
//                                    BuildingButtonView(bulding: building)
//                            }
                            HStack {

                                if let coordinate = viewModel.coordinate {
                                    BuildingButtonView(building: building, distanceInMeters: building.distanceTo(coordinate: coordinate))
                                } else {
                                    BuildingButtonView(building: building)
                                }
                                Image(systemName: "arrow.up.right.square.fill")
                            }.onTapGesture {
                                if let url = URL(string: "https://tiss.tuwien.ac.at/events/register.xhtml?dswid=6157&dsrid=905&buildingCode="+building.buildingCode) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }

                } else {
                    Text("Buildings failed to load")

                }
            }
            .navigationBarTitle("Buildings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingListView()
    }
}
