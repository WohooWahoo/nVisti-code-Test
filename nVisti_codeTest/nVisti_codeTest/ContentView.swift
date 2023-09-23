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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
