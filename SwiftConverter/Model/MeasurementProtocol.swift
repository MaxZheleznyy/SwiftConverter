//
//  MeasurementProtocol.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/17/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

protocol MeasurementProtocol {
    static var name: String { get }
    static var includedUnits: [Unit] { get }
}
