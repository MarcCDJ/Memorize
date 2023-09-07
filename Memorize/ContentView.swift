//
//  ContentView.swift
//  Memorize
//
//  Created by Marc Cruz on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "👽", "🙀", "💀", "🕸️", "🍭", "☠️", "😱", "🤡", "🧕🏽"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                
                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                .disabled(cardCount <= 1)
                
                Spacer()
                
                
                Button(action: {
                    cardCount += 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
                .disabled(cardCount >= emojis.count)
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
