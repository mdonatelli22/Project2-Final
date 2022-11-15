//
//  ReviewView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        Text("Review Items")
            .bold()
            .font(.largeTitle)
            .position(x: 160, y: 5)
            .foregroundColor(.teal)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
