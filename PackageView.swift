//
//  PackageView.swift
//  Core Data
//
//  Created by Amitabh Mishra on 10/14/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI

struct PackageView: View {
    
    var title: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView(title: "Package Info", createdAt: "Today")
    }
}
