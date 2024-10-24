//
//  ContentView.swift
//  MapsAPI
//
//  Created by k mao on 10/24/24.
//

import SwiftUI
import MapKit

struct Location: Identifiable, Codable {
  
  var id = UUID()
  var longitude: Double
  var latitude: Double
  var description: String
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case longitude
    case latitude
    case description
  }
  
  // To conform to Comparable protocol
//  static func < (lhs: Location, rhs: Location) -> Bool {
//    lhs.longitude < rhs.latitude
//  }
//  
//  static func == (lhs: Location, rhs: Location) -> Bool {
//    lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
//  }
  
  // MARK: Example for SwiftUI
//  static let example = Location(id: UUID(), name: "Target", scans: [PriceScan.example])
  
}

struct ContentView: View {
  @ObservedObject var locationRepository = LocationRepository()
  @State private var selectedLocation: Location?
  
    var body: some View {
      let locations = locationRepository.locations
      VStack {
        NavigationView {
          Map() {
            ForEach(locations) { c in
              Marker(c.description, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(c.latitude), longitude: CLLocationDegrees(c.longitude)))
            }
            
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
