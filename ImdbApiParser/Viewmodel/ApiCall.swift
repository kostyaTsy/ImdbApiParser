//
//  ApiCall.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 25.05.22.
//

import Foundation

final class ApiCall<ModelType: Codable>: ObservableObject {
    @Published var dataModel: ModelType?
    @Published var errorMessage: String?
    @Published var isError: Bool = false
    
    // Fetching data from url, get json decode to ModelType
    func fetch(url: URL) {
        isError = false
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                self.errorMessage = error?.localizedDescription
                self.isError = true
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            do {
                let movies = try JSONDecoder().decode(ModelType.self, from: data)
                DispatchQueue.main.async {
                    self.dataModel = movies
                    print("Load")
                    //print(self.dataModel as Any)
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error in decoding data"
                    self.isError = true
                }
                print("Error in decoding data")
            }

        }
        .resume()
    }
}
