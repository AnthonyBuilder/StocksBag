//
//  newStockView.swift
//  StocksBag
//
//  Created by Anthony on 04/07/21.
//

import SwiftUI

struct NewStockView: View {
    
    @EnvironmentObject var stockViewModel: StockViewModel
    @State private var nameStockSymbol: String = ""
    @State private var selection = Set<String>()
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List(searchResults, id: \.symbol, selection: $selection) { symbol in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(symbol.symbol).fontWeight(.bold).font(.headline)
                            Text(symbol.name).font(.subheadline)
                        }
                        Spacer()
                        Text(symbol.type).font(.caption2).foregroundColor(.secondary)
                    }
                }.searchable(text: $nameStockSymbol)
                    .navigationBarItems(leading: Button(action: {
                        stockViewModel.addSymbol(name: selection)
                        isShowing = false
                    }, label: { Text("Concluido") }))
                 .navigationTitle("Adicionar Símbolo")
                 .toolbar {
                     EditButton()
                 }
            } else {
                // Fallback on earlier versions
            }
        }
    }

    var searchResults: [Datum] {
        if nameStockSymbol.isEmpty {
            return stockViewModel.symbols.removingDuplicates()
        } else {
            return stockViewModel.symbols.filter { $0.symbol.contains(nameStockSymbol)}
        }
    }
}


