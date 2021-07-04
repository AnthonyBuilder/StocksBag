//
//  StockSymbolStore.swift
//  StocksBag
//
//  Created by Anthony on 21/06/21.
//

import Foundation
import SwiftUI

extension StockViewModel {
    
    @Published var symbols: [String] = []
    
    // Add new value on symbols
    // If not value Untitled is default
    func addSymbol(named name: String = "Untitled") {
        symbols.append(name)
        print(symbols)
    }
    
    // remove symbols using IndexSet
    func removeSymbol(at offsets: IndexSet) {
        symbols.remove(atOffsets: offsets)
        print(symbols)
    }
    
    // Update symbol value where symbol is equal to the argument
    func updateSymbol(at symbol: String, for value: String) {
        if let i = symbols.firstIndex(of: symbol) {
            symbols[i] = value
        }
    }
    
    init() {
        if symbols.isEmpty {
            addSymbol()
        }
    }
}
