//
//  APIService.swift
//  StocksBag
//
//  Created by Anthony on 16/06/21.
//

import Foundation

class APIService: NSObject {
    func fetchStocks(completion: @escaping ([StockModel]) -> ()){
        guard let url = URL(string: "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c3556dqad3idcjopg5cg") else {
           fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, request, error in
            if error != nil {
                print(error ?? "Data instance is nil")
                return
            } else {
                let stocks = try? JSONDecoder().decode([StockModel].self, from: data!)
                DispatchQueue.main.async {
                    completion(stocks!)
                }
            }
        }.resume()
        
    }
}
