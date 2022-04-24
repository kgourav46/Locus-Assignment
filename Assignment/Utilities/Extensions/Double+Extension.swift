//
//  Double+Extension.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

extension Double {
    func convertToDateString(format: String = DateFormat.MMMddhhmma) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
