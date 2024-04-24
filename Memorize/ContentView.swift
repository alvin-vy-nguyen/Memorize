//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Nguyen on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐳", "🦑", "🦞", "🐙"]
    var body: some View {
        HStack {
            // Integers up to & NOT including 4
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
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
