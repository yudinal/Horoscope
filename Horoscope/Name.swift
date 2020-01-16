//
//  Name.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/15/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation
//
//struct Name {
//    let fullName: [Names]
//}

struct Names: Codable {
    let first: String
    let last: String
    
    static func getNames() -> [Names] {
        var names = [Names]()
        var userNames = ["Lilia", "Juan", "Alex"]
        for userName in userNames {
        let name = Names(first: userName, last: userName)
            names.append(name)
    }
        return names
}
}
