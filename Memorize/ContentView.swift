import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    let vehicles: [String] = ["🚗", "🚕", "🚌", "🚎", "🏎️", "🚓", "🚚", "🛴", "✈️", "🚆"]
    
    let animals: [String] = ["🐮", "🪰", "🐗", "🐷", "🦧", "🐞", "🪼"]
    
    let foods: [String] = ["🍏", "🍟", "🥑", "🧆", "🍇", "🍰", "🥝", "🍩", "🍍", "🥥"]
    
    @State var deckOfCards: [String] = []
        
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        
        ScrollView {
            cards
        }
        .padding()
        
        HStack {
            vehiclesThemeButton
            animalThemeButton
            foodThemeButton
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(deckOfCards.indices, id: \.self) { index in
                CardView(content: deckOfCards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    var vehiclesThemeButton: some View {
        return makeButtonAndCards(themeName: "Vehicles", cards: vehicles, symbol: "car.circle")
    }
    
    var animalThemeButton: some View {
        return makeButtonAndCards(themeName: "Animals", cards: animals, symbol: "pawprint.circle")
    }

    var foodThemeButton: some View {
        return makeButtonAndCards(themeName: "Food", cards: foods, symbol: "fork.knife.circle" )
    }
    
    func makeButtonAndCards(themeName: String, cards: [String], symbol: String ) -> some View {
        VStack {
            Button(action: {
                let duplicatedCards = cards + cards
                deckOfCards = duplicatedCards.shuffled()
            }, label: {
                Image(systemName: symbol)
                    .imageScale(.large)
                    .font(.largeTitle)
            })
            Text(themeName)
                .font(.system(size: 15))
                .foregroundStyle(.blue)
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 0 : 1)
            base.fill().opacity(isFaceUp ? 1 : 0)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
