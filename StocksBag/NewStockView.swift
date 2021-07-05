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
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Novo Símbolo").font(.headline).padding()
                HStack {
                    Spacer()
                    Button(action: { isShowing = false }, label: { Text("Concluido") }).padding()
                }
            }
            Divider()
            Form {
                Section {
                    TextField("Símbolo da Bolsa", text: $nameStockSymbol,   onEditingChanged: { began in
                        if !began {
                            stockViewModel.addSymbol(name: self.nameStockSymbol.uppercased())
                        }
                    }).padding()
                }
            }
        }
    }
}

