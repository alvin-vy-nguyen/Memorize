//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Nguyen on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🐳").font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            //isFaceUp = !isFaceUp is the same as:
            isFaceUp.toggle()
        }
    }
}























#Preview {
    ContentView()
}
