//
//  StockViewModel.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//


import Combine
import SwiftUI

class StockViewModel: ObservableObject {
    
    private var service: APIService
    @Published var stockData: [StockModel] = []
    
    init() {
        self.service = APIService()
        getStocks()
    }
    
    func getStocks() {
        self.service.fetchStocks() { stockData in
            self.stockData = stockData
        }
    }
}
