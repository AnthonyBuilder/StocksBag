//
//  ContentView.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.q
//

import SwiftUI
import CoreData

struct StocksView: View {
    
    @ObservedObject var stockViewModel = StockViewModel()
    @State var showStockDetails: Bool = false
    
    var body: some View  {
        NavigationView {
            List(stockViewModel.stockData, id: \.self) { stock in
                NavigationLink(destination: Text("Fechamento \(stock.close)")) {
                    VStack(alignment: .leading) {
                        Text(stock.symbol)
                        Text("Abertura \(stock.open)").foregroundColor(.red)
                    }.onTapGesture {
                        showStockDetails = true
                    }
                }

            }
            .navigationBarTitle("Stocks")
            .navigationBarItems(trailing: Image(systemName: "line.horizontal.3.decrease.circle"))
        }
    }
}



