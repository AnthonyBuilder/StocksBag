//
//  StockViewModel.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI

class StockViewModel: ObservableObject {
    
    private var service: APIService
    @Published var stockData: [StockDetails] = []
    
    init() {
        self.service = APIService()
        getStocksWithSimbol()
    }
    
    func getStocksWithSimbol() {
        self.service.fetchStocks { stockData in
            self.stockData = stockData.symbol
        }
    }
}
