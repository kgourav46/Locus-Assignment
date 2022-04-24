//
//  Dynamic.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit
import SwiftUI

class Dynamic<T>: Decodable where T: Decodable {
  
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
    
}
