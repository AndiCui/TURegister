//
//  NavigationView.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationView {
            BuildingListView()
                .navigationTitle("Buildings")
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
