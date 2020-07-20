//
//  CollectionExtension.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/20/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
