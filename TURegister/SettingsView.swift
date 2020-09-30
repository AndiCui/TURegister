//
//  SettingsView.swift
//  TURegister
//
//  Created by AndiCui on 30.09.20.
//

import SwiftUI

struct SettingsView: View {
    @State private var username: String = "Tim"
    @State private var password: String = "Tim"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("TISS Account")) {
                    HStack {
                        Text("Username")
                        Spacer()
                        TextField("12345678", text: $username)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Password")
                        Spacer()
                        SecureField("", text: $password)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
