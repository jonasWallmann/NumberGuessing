//
//  ContentView.swift
//  NumberGuessing
//
//  Created by Jonas Wallmann on 29.05.22.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var vm: NumberVM
    
    var body: some View {
        VStack {
            Text("to guess...")
                .font(.title2)
            TextField("number", value: $vm.number, format: .number)
                .frame(width: 75)
            if(vm.correctNumberInput) {
                NavigationLink(destination: GuessView()) {
                    Text("guess")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(NumberVM())
    }
}
