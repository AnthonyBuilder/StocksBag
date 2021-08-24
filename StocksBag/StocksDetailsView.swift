//
//  StocksDetailsView.swift
//  StocksBag
//
//  Created by Anthony on 13/07/21.
//

import SwiftUI

struct StockDetailsView: View {
    let stockModel: StockDetails

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(stockModel.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("Fechou hoje com:").font(.headline).fontWeight(.semibold)
                            Text(stockModel.close).font(.headline).foregroundColor(.secondary)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Abertura - \(stockModel.open)").font(.body)
                            Text("Alta - \(stockModel.high)").font(.body)
                            Text("Baixa - \(stockModel.low)").font(.body)
                        }
                        Spacer()
                        HStack {
                            Text(stockModel.datetime).fontWeight(.bold)
                            Text(stockModel.currency)
                        }.font(.body)
                    }
                    
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading)
        }.navigationBarTitle(stockModel.symbol)
    }
}
