//
//  MovieRow.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import SwiftUI

struct MovieRow: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subTitle)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(title: "Terminator", subTitle: "Action")
    }
}
