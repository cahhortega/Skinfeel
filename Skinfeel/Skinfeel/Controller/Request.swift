//
//  Request.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import Foundation
import UIKit

class Request {

    public func getData(from url: String, _ completion: @escaping (Result<[Product], Error>) -> Void){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Algo de errado não esta certo.")
                return
            }
            
            var result: [Product]
            do {
                result = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(result))
            } catch {
                print("Falha na conversão: \(error)")
                completion(.failure(error))
            }
            
            
        }).resume()
    }


}
