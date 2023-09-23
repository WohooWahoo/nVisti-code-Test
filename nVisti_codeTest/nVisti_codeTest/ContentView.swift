//
//  ContentView.swift
//  nVisti_codeTest
//
//  Created by Randall_B on 9/23/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @State private var originLatitude: String = ""
    @State private var originLongitude: String = ""
    @State private var destLatitude: String = ""
    @State private var destLongitude: String = ""
    
    @State private var distance: String = ""
 
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Origin Coordinate:")
                        .font(.headline)
                    TextField("Latitude", text: $originLatitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Longitude", text: $originLongitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Text("Destination Coordinate:")
                        .font(.headline)
                    TextField("Latitude", text: $destLatitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Longitude", text: $destLongitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            }
        }

    }
}

#Preview {
    ContentView()
}
