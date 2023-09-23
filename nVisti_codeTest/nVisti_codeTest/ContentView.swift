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
                
                Button(action: {
                    calculateDistance()
                }) {
                    Text("Calculate Distance")
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(50)
                
                Text("Distance: \(distance) km")
                    .padding(50)
            }
        }
    }
    
    func calculateDistance() {
        guard let originLat = Double(originLatitude),
              let originLon = Double(originLongitude),
              let destinationLat = Double(destLatitude),
              let destinationLon = Double(destLongitude)
        else {
            return
        }
        
        let originCoordinate = CLLocationCoordinate2D(latitude: originLat, longitude: originLon)
        let destinationCoordinate = CLLocationCoordinate2D(latitude: destinationLat, longitude: destinationLon)
        
        let originLocation = CLLocation(latitude: originCoordinate.latitude, longitude: originCoordinate.longitude)
        let destinationLocation = CLLocation(latitude: destinationCoordinate.latitude, longitude: destinationCoordinate.longitude)
        
        let distanceInMeters = originLocation.distance(from: destinationLocation)
        let distanceInKilometers = distanceInMeters / 1000
        
        distance = String(format: "%.2f", distanceInKilometers)
    }
    
    struct MapView: UIViewRepresentable {
        let originCoordinate: CLLocationCoordinate2D
        let destinationCoordinate: CLLocationCoordinate2D
        
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            
            let originAnnotation = MKPointAnnotation()
            originAnnotation.coordinate = originCoordinate
            originAnnotation.title = "Origin"
            mapView.addAnnotation(originAnnotation)
            
            let destinationAnnotation = MKPointAnnotation()
            destinationAnnotation.coordinate = destinationCoordinate
            destinationAnnotation.title = "Destination"
            mapView.addAnnotation(destinationAnnotation)
            
            let centerCoordinate = CLLocationCoordinate2D(latitude: (originCoordinate.latitude + destinationCoordinate.latitude) / 2, longitude: (originCoordinate.longitude + destinationCoordinate.longitude) / 2)
            let span = MKCoordinateSpan(latitudeDelta: abs(originCoordinate.latitude - destinationCoordinate.latitude) * 1.5, longitudeDelta: abs(originCoordinate.longitude - destinationCoordinate.longitude) * 1.5)
            let region = MKCoordinateRegion(center: centerCoordinate, span: span)
            
            mapView.setRegion(region, animated: true)
            
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
            // updates to MapView go here... if needed
        }
    }

    
}

#Preview {
    ContentView()
}
