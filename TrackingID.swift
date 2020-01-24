//
//  Tracking.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI

struct TrackingID: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Package.getAllPackages()) var package:FetchedResults<Package>
    
    @State private var sourceSel = 0
    @State private var destinationSel = 0
    @State private var packageWeight = 0
    @State private var showDetails = false
    
    let source: String
    let destination: String
    
    let trackingID = Int.random(in: 1..<1000000000)
    
    var sources = ["Northborough, MA", "Edison, NJ", "Pittsburgh, PA", "Martinsburg, WV", "Charlotte, NC", "Atlanta, GA", "Orlando, FL", "Memphis, TN", "Grove City, OH", "Indianapolis, IN", "Detroit, MI", "New Berlin, WI", "Minneapolis, MN", "St. Louis, MO", "Kansas, KS", "Dallas, TX", "Houston, TX", "Denver, CO", "Salt Lake City, UT", "Phoenix, AZ", "Los Angeles, CA", "Chino, CA", "Sacremento, CA", "Seattle, WA"]
    
    var destinations = ["Northborough, MA", "Edison, NJ", "Pittsburgh, PA", "Martinsburg, WV", "Charlotte, NC", "Atlanta, GA", "Orlando, FL", "Memphis, TN", "Grove City, OH", "Indianapolis, IN", "Detroit, MI", "New Berlin, WI", "Minneapolis, MN", "St. Louis, MO", "Kansas, KS", "Dallas, TX", "Houston, TX", "Denver, CO", "Salt Lake City, UT", "Phoenix, AZ", "Los Angeles, CA", "Chino, CA", "Sacremento, CA", "Seattle, WA"]

    var body: some View {
        VStack {
            NavigationView {
                Form {
                   Section {
                        Picker(selection: $sourceSel, label: Text("Package Source")) {
                            ForEach(0 ..< sources.count) {
                                Text(self.sources[$0]).tag($0)
                            }
                        }
                    
                        Picker(selection: $destinationSel, label: Text("Package Destination")) {
                            ForEach(0 ..< destinations.count) {
                                Text(self.destinations[$0]).tag($0)
                            }
                        }
                    
                        Stepper("Package Weight", onIncrement: {
                            self.packageWeight += 1
                        }, onDecrement: {
                            self.packageWeight -= 1
                        })
                    
                        Text("Weight: \(packageWeight) lbs")
                    }
                    
                    Button(action: {self.showDetails.toggle()}) {
                        Text("Create Package")
                    }
                    
                    if showDetails {
                        Text("Tracking ID: " + String(trackingID))
                        Text("Source: \(sources[sourceSel])")
                        Text("Destination: \(destinations[destinationSel])")
                        Text("Weight: \(packageWeight) lbs")
                    }
                }
                .navigationBarTitle(Text("Create a Package"))
            }
        }
    }
}

struct TrackingID_Previews: PreviewProvider {
    static var previews: some View {
        TrackingID()
    }
}
