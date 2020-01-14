//
//  File.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/13/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation

struct Horoscopes: Codable {
    let results: [Horoscope]
}

struct Horoscope: Codable {
    let sunsign: String
    let date: String
    let horoscope: String
}
