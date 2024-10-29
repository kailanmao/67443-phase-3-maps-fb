// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'


import Combine
// import Firebase modules here
import FirebaseCore
import FirebaseFirestore

class LocationRepository: ObservableObject {
  // Set up properties here
      // Firestore reference
      private var db = Firestore.firestore()

      // Published array to store fetched locations
      @Published var locations: [Location] = []

      // Firestore listener to keep track of real-time updates
      private var cancellables = Set<AnyCancellable>()

      init() {
          // Ensure Firebase is configured
          if FirebaseApp.app() == nil {
              FirebaseApp.configure()
          }

          // Call the get function to fetch data when initialized
          get()
      }
      
      func get() {
          // Complete this function
          // Fetch data from the Firestore "locations" collection
          db.collection("locations").addSnapshotListener { (querySnapshot, error) in
              // Error handling
              if let error = error {
                  print("Error fetching documents: \(error)")
                  return
              }
              
              // Clear current locations
              self.locations.removeAll()

              // Parse the fetched documents into the locations array
              if let querySnapshot = querySnapshot {
                  self.locations = querySnapshot.documents.compactMap { document in
                      try? document.data(as: Location.self)
                  }
              }
          }
      }
  }

  
  
//  init() {
//    get()
//  }

//  func get() {
    // Complete this function
    // open up project from wordkspace
    // create a .gitignore
    
    
    
    
    

  

