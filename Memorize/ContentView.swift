//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Nguyen on 4/20/24.
//

import SwiftUI

struct Themes {
    
    var label: String
    var theme: [String]
    var symbol: String
    var themeColor: Color
    
    static let ocean_theme = ["🐳", "🦑", "🦞", "🐙", "🐟", "🐋", "🐳", "🦑", "🦞", "🐙", "🐟", "🐋"]
    static let bug_theme = ["🐝", "🪱", "🐛", "🦋", "🐌", "🐞", "🐝", "🪱", "🐛", "🦋", "🐌", "🐞"]
    static let bird_theme = ["🐦‍⬛", "🦆", "🦅", "🦉", "🐓", "🦃", "🐦‍⬛", "🦆", "🦅", "🦉", "🐓", "🦃"]
}

struct ContentView: View {
    
    @State var emojis: [String] = Themes.ocean_theme
    
    @State var themeColorSelected: Color = .blue
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            // ScrollView is like a VStack
            ScrollView {
                cards
            }
            Spacer()
            themeModify
        }
        .padding()
    }
    
    var themeModify: some View {
        HStack {
            themeButtonsView
                .padding([.top, .leading, .trailing], 30)
                .padding(.bottom, 10)
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
            // Integers up to & NOT including 4
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(themeColorSelected)
    }
    
    func themeChanger(themeText: String, theme: [String], symbol: String, themeColor: Color) -> some View {
        VStack {
            Button(action: {
                emojis = theme
                emojis.shuffle()
                themeColorSelected = themeColor
            }, label: {
                Image(systemName: symbol)
            })
            .imageScale(.large)
            .font(.largeTitle)
            .tint(themeColor)
            Text(themeText)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(themeColor)
        }
    }
    
    let themeButtons = [
        Themes(label: "Fishes", theme: Themes.ocean_theme, symbol: "fish.circle", themeColor: .blue),
        Themes(label: "Bugs", theme: Themes.bug_theme, symbol: "ant.circle", themeColor: .green),
        Themes(label: "Birds", theme: Themes.bird_theme, symbol: "bird.circle", themeColor: .gray)
    ]
    
    var themeButtonsView: some View {
        ForEach(themeButtons, id: \.label) { buttonData in
            themeChanger(themeText: buttonData.label, theme: buttonData.theme, symbol: buttonData.symbol, themeColor: buttonData.themeColor)
        }
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
