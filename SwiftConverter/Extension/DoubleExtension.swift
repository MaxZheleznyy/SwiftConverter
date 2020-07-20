//
//  DoubleExtension.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/20/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

extension Double {
    func convertToShortString() -> String {
        let formatter = NumberFormatter()
        let nsnumber = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        
        return String(formatter.string(from: nsnumber) ?? "")
    }
}
