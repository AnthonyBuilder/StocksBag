//
//  ContentView.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21
//

import SwiftUI

struct StocksView: View {

    @ObservedObject var stockViewModel = StockViewModel()
    @State private var showNewStock: Bool = false

    var body: some View  {
        NavigationView {
            List {
                ForEach(stockViewModel.stockDetails, id: \.symbol) { symbol in
                    NavigationLink(destination: Text("Fechamento \(symbol.close)")) {
                        VStack(alignment: .leading) {
                            Text(symbol.symbol)
                            Text(symbol.high).font(.caption)
                        }
                    }.navigationBarItems(trailing: Button(action: { showNewStock = true }, label: { Image(systemName: "plus")}))
                     .navigationTitle("Stocks")
                }
            }
        }.sheet(isPresented: $showNewStock) {
            NewStockView(isShowing: $showNewStock).environmentObject(self.stockViewModel)
        }
    }
}
