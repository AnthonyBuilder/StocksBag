//
//  APIService.swift
//  StocksBag
//
//  Created by Anthony on 16/06/21.
//

import Foundation


class APIService {

    let headers = [
        "x-rapidapi-key": "5a8663bb4bmsh5267c9c5c460cc9p1e2a42jsn9142971fb9bd",
        "x-rapidapi-host": "twelve-data1.p.rapidapi.com"
    ]
    
    func fetchStocks(completion: @escaping (StockModel) -> ()) {
        
        var request = URLRequest(url: URL.stocks)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, request, error in
            if error != nil {
                print(error ?? "")
            } else {
                let stocks = try? JSONDecoder().decode(StockModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(stocks!)
                }
            }
        }.resume()
    }
}

extension URL {
    static var stocks: URL {
        URL(string: "https://twelve-data1.p.rapidapi.com/quote?symbol=AMZN%2CAAPL%2CSBUX%2CTSLA")! as URL
    }
}

