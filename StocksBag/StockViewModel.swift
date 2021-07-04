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

    init() {
        self.service = APIService()
        getStocksWithSimbol()
    }

    // comunicate view to API for get Stocks
    func getStocksWithSimbol() {
        self.service.fetchStocks { stockData in
            self.stockDetails = stockData.symbol
        }
    }

    func addSymbol(name symbol: String) {
        service.symbol += "\(symbol),"
        getStocksWithSimbol()
    }
}
