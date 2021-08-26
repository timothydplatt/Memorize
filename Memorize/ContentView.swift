//
//  ContentView.swift
//  Memorize
//
//  Created by Timothy Platt on 24/08/2021.
//

import SwiftUI

struct ContentView: View {

    enum Theme {
        case vehicles, foods, emotions
    }

    @State var emojis = ["🚂", "✈️", "🚁", "🚜", "🚖", "🚗", "🚘", "🚙", "🚚", "🚛", "🚝", "🚞", "🚟", "🚠", "🚡", "🚤", "🚲", "🏍", "🏎", "🛥", "🛩", "⛵️", "⛴", "🚀"]

    //var emojis = ["🚂", "✈️"]

    var vehicleEmojis = ["🚂", "✈️", "🚲"]
    var foodEmojis = ["🧀", "🍉", "🍕"]
    var emotionEmojis = ["😄", "😍", "😇"]

    @State var emojiCount = 3
    @State var themeSelected: Theme = .vehicles

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
                Spacer()
                HStack {
                    //remove
                    //Spacer()
                    //add
                    Spacer()
                    vehicles
                    Spacer()
                    foods
                    Spacer()
                    emotions
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .navigationBarTitle("Memorize")
        }
    }

    //    var remove: some View {
    //        Button {
    //            if emojiCount > 1 {
    //                emojiCount -= 1
    //            }
    //        } label: {
    //            Image(systemName: "minus.circle")
    //        }
    //    }
    //
    //    var add: some View {
    //        Button {
    //            if emojiCount < emojis.count {
    //                emojiCount += 1
    //            }
    //        } label: {
    //            Image(systemName: "plus.circle")
    //        }
    //    }

    var vehicles: some View {
        Button {
            if themeSelected != .vehicles {
                themeSelected = .vehicles
                emojis = vehicleEmojis.shuffled()
                //emojis.shuffle()
                emojiCount = vehicleEmojis.count
            }
        } label: {
            VStack(spacing: 10) {
                Image(systemName: "car")
                Text("Vehicles").fontWeight(.regular)
                    .font(.body)
            }
        }
        .font(.largeTitle)
    }

    var foods: some View {
        Button {
            if themeSelected != .foods {
                themeSelected = .foods
                emojis = foodEmojis.shuffled()
//                emojis.shuffle()
                emojiCount = foodEmojis.count
            }
        } label: {
            VStack(spacing: 10) {
                Image(systemName: "questionmark.circle")
                Text("Foods").fontWeight(.regular)
                    .font(.body)
            }
        }
        .font(.largeTitle)
    }

    var emotions: some View {
        Button {
            if themeSelected != .emotions {
                themeSelected = .emotions
                emojis = emotionEmojis.shuffled()
                //emojis.shuffle()
                emojiCount = emotionEmojis.count
            }
        } label: {
            VStack(spacing: 10) {
                Image(systemName: "questionmark.circle")
                Text("Emotions").fontWeight(.regular)
                    .font(.body)
            }
        }
        .font(.largeTitle)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).multilineTextAlignment(.center).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
