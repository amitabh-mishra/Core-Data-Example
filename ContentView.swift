//
//  ContentView.swift
//  Core Data
//
//  Created by Amitabh Mishra on 10/14/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Package.getAllPackages()) var package:FetchedResults<Package>
    
    @State private var newPackage = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Enter Tracking ID")) {
                    HStack {
                        TextField("Tracking ID", text: self.$newPackage)
                        Button(action: {
                            let package = Package(context: self.managedObjectContext)
                            package.packageDestination = self.newPackage
                            package.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }
                            catch {
                                print(error)
                            }
                            
                            self.newPackage = ""
                        }){
                            Image(systemName: "plus.circle")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("Package Info")) {
                    ForEach(self.package) {package in
                        PackageView(title: package.packageDestination, createdAt: "\(package.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.package[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Track A Package"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
