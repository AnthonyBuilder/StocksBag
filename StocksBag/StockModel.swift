//
//  StocksModel.swift
//  StocksBag
//
//  Created by Anthony on 15/06/21.
//

import SwiftUI

struct StockModel: Decodable, Hashable {
    var datum: [StockDetails]

    // Define DynamicCodingKeys type needed for creating
    // decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {
        var intValue: Int?

        init?(intValue: Int) {
            return nil
        }

        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
    }

    init(from decoder: Decoder) throws {
        // Decoding container using DynamicCodingKeys
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempArray = [StockDetails]()

        // Loop turn key in container
        for key in container.allKeys {
            let decodedObject = try container.decode(StockDetails.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        // Finished assign tempArray to StockDetails
        datum = tempArray
    }
}

// MARK: - StockDetails
struct StockDetails: Decodable, Hashable {
    let symbol, name, exchange, currency: String
    let open, datetime, high, low, close: String
}

// MARK: - SymbolModel
struct SymbolModel: Codable, Hashable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable, Hashable {
    let symbol, name, type: String
}

