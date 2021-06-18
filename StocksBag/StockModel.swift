//
//  StocksModel.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI

struct StockModel: Codable, Hashable {
    let symbol: String
    let currency: String
    let description: String
}
