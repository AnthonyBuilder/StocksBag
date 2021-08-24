//
//  APIService.swift
//  StocksBag
//
//  Created by Anthony on 16/06/21.
//

import Foundation

class APIService: ObservableObject {

    @Published var symbol: [String] = ["AAPL", "TSLA"]
    let headers = [
"x-rapidapi-key": "5a8663bb4bmsh5267c9c5c460cc9p1e2a42jsn9142971fb9bd",
"x-rapidapi-host": "twelve-data1.p.rapidapi.com"
]
    
    func fetchStocks(completion: @escaping (StockModel) -> ()) {
        symbol.removeDuplicates()
        
        if symbol.isEmpty {
            print("symbol var empty \(symbol)")
        } else {
            var component = URLComponents(string: "https://twelve-data1.p.rapidapi.com/quote?")!
            component.queryItems = [URLQueryItem(name: "symbol", value: symbol.joined(separator: ","))]
            component.percentEncodedQuery = component.percentEncodedQuery?.replacingOccurrences(of: ",", with: "%2C")

            var request = URLRequest(url: component.url! as URL)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            URLSession.shared.dataTask(with: request as URLRequest) { data, request, error in
                if let error = error {
                    print(error)
                } else {
                    if let data = data {
                        let stocks = try! JSONDecoder().decode(StockModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(stocks)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchSymbols(completion: @escaping (SymbolModel) -> ()) {
        var request = URLRequest(url: URL(string: "https://twelve-data1.p.rapidapi.com/stocks?exchange=NASDAQ&format=json&outputsize=30")! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, request, error in
            if error != nil {
                print(error ?? "Erro ao contatar o servidor)")
            } else {
                let symbols = try? JSONDecoder().decode(SymbolModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(symbols!)
                }
            }
        }.resume()
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
