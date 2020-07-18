//
//  PublicMeasurments.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/17/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct PublicMeasurments {
    static let measurments: [MeasurementProtocol.Type] = [
        Area.self,
        Length.self,
        Power.self,
        Temperature.self,
        Volume.self,
        Weight.self
    ]
}
