//
//  StockViewModel.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI

class StockViewModel: ObservableObject {

    private var service: APIService
    @Published var stockDetails: [StockDetails] = []
    @Published var symbols: [Datum] = []

    init() {
        self.service = APIService()
        getAllSymbols()
        getStocks()
    }

    // comunicate view to API for get Stocks
    func getStocks() {
        self.service.fetchStocks { stock in
            self.stockDetails = stock.datum
        }
    }
    
    func getAllSymbols() {
        self.service.fetchSymbols { symbols in
            self.symbols = symbols.data
        }
    }

    // add symbol on APIService symbol var
    func addSymbol(name symbol: Set<String>) {
        service.symbol.append(contentsOf: symbol)
        getStocks()
    }
    
//    func removeRows(at offsets: Int) {
//        var symbolResolve = Array(service.symbol)
//        symbolResolve.remove(at: offsets)
//    }
}
