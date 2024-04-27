//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Nguyen on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐳", "🦑", "🦞", "🐙", "🐟", "🐋", "🐡"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            // ScrollView is like a VStack
            ScrollView {
                cards
            }
            Spacer()
            cardCountModify
        }
        .padding()
    }
    
    var cardCountModify: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            // Integers up to & NOT including 4
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus.square")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "plus.square")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            // Group is for each of 1
            // Good way to switch between 2 states if you need the same sizing and spacing
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
