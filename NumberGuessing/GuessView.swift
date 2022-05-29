//
//  GuessView.swift
//  NumberGuessing
//
//  Created by Jonas Wallmann on 29.05.22.
//

import SwiftUI

struct GuessView: View {
    
    @EnvironmentObject var vm: NumberVM
    
    var body: some View {
        VStack(spacing: 35) {
            hint
            history
        }
        .padding(.top, 10)
    }
    
    var hint: some View {
        HStack(spacing: 20) {
            HintButtonView(smaller: true)
            Text(String(vm.guess))
                .font(.title)
                .foregroundColor(vm.guessed ? .green : .black)
            HintButtonView(smaller: false)
        }
    }
    
    var history: some View {
        List(vm.guessList) { guess in
            HStack {
                Text(String(guess.number))
                Spacer()
                Image(systemName: guess.smaller ? "arrow.down" : "arrow.up")
            }
        }
    }
}

struct HintButtonView: View {
    
    @EnvironmentObject var vm: NumberVM
    
    let smaller: Bool
    
    var body: some View {
        if(!vm.guessed) {
            Button {
                vm.hint(smaller: smaller)
            } label: {
                Image(systemName: smaller ? "arrow.left" : "arrow.right")
            }
            .buttonStyle(.bordered)
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
            .environmentObject(NumberVM())
    }
}
