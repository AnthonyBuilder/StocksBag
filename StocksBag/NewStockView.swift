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
    
    var body: some View {
        VStack {
            Section {
                Text("Novo simbolo")
                TextField("Simbolo da bolsa", text: $nameStockSymbol, onCommit: {
                    stockViewModel.addSymbol(name: nameStockSymbol)
                })
            }
        }
    }
}

