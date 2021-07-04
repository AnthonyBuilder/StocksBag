//
//  APIService.swift
//  StocksBag
//
//  Created by Anthony on 16/06/21.
//

import Foundation

class APIService: ObservableObject {
    
    let headers = [
        "x-rapidapi-key": "5a8663bb4bmsh5267c9c5c460cc9p1e2a42jsn9142971fb9bd",
        "x-rapidapi-host": "twelve-data1.p.rapidapi.com"
    ]
    
    @Published var symbol: String = "AAPL,"
    
    func fetchStocks(completion: @escaping (StockModel) -> ()) {
        var component = URLComponents(string: "https://twelve-data1.p.rapidapi.com/quote?")!
        component.queryItems = [URLQueryItem(name: "symbol", value: symbol)]
        component.percentEncodedQuery = component.percentEncodedQuery?.replacingOccurrences(of: ",", with: "%2C")
        
        var request = URLRequest(url: component.url! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, request, error in
            if error != nil {
                print(error ?? "Erro ao contatar o servidor)")
            } else {
                let stocks = try? JSONDecoder().decode(StockModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(stocks!)
                }
            }
        }.resume()
    }
}
