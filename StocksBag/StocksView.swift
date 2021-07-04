//
//  ContentView.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21
//

import SwiftUI

struct StocksView: View {
    
    @ObservedObject var stockViewModel = StockViewModel()
    @State private var editMode: EditMode = .inactive
    @State private var showNewStock: Bool = false
    
    var body: some View  {
        NavigationView {
            List(stockViewModel.stockDetails, id: \.symbol) { symbol in
                NavigationLink(destination: Text("Fechamento \(symbol.currency)")) {
                    VStack(alignment: .leading) {
                        Text(symbol.symbol)
                        Text(symbol.exchange)
                    }
                }
            }.navigationBarItems(trailing: Button(action: { showNewStock = true }, label: { Image(systemName: "plus")}))
        }
        .sheet(isPresented: $showNewStock) {
            NewStockView().environmentObject(self.stockViewModel)
        }
    }
}
