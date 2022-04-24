//
//  APIRequest.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

class APIRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }

    func perform<T: Decodable>(with completion: @escaping (T?, String?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url) { (data, _, serverError) in
            guard let data = data else {
                completion(nil, serverError?.localizedDescription)
                return
            }
            do {
                let decoder = JSONDecoder()
                completion(try decoder.decode(T.self, from: data), nil)
            } catch {
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
