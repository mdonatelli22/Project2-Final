//
//  Project2_FinalApp.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

@main
struct Project2_FinalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
