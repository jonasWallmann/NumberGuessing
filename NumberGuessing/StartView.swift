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
            TextField("number", value: $vm.number, format: .number)
                .textFieldStyle(.roundedBorder)
            if(vm.correctNumberInput) {
                NavigationLink(destination: GuessView()) {
                    Text("start")
                }
            }
        }
        .frame(width: 100,alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(NumberVM())
    }
}
