//
//  NumberGuessingApp.swift
//  NumberGuessing
//
//  Created by Jonas Wallmann on 29.05.22.
//

import SwiftUI

@main
struct NumberGuessingApp: App {
    
    @StateObject var vm: NumberVM = NumberVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .environmentObject(vm)
        }
    }
}
