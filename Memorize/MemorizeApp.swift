//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mirelle Alessandre on 07/03/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
