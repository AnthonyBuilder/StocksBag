//
//  ContentView.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI
import CoreData

struct StocksView: View {
    
    @ObservedObject var stockViewModel = StockViewModel()
    
    var body: some View  {
        NavigationView {
            List(stockViewModel.stockData, id: \.self) { stock in
                VStack(alignment: .leading) {
                    Text(stock.symbol)
                    Text(stock.description).font(.caption2)
                }
            }
            .navigationBarTitle("Stocks")
            .navigationBarItems(trailing: Image(systemName: "plus"))
        }
    }
}


