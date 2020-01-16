//
//  UserPreference.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/16/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation

struct UserPreferenceKey {
    static let pickedSign = "User Sign"
    static let name = "User Name"
}

class UserPreference {
    private init() {}
    
    private let standard = UserDefaults.standard
    
    static let shared = UserPreference()
    func updatePickedSign(with sign: String) {
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.pickedSign)
    }
    func updateName(with name: String) {
        UserDefaults.standard.set(name, forKey: UserPreferenceKey.name)
    }
    func getSign() -> String? {
        guard let pickedSign = UserDefaults.standard.object(forKey: UserPreferenceKey.pickedSign) as? String else {
            return nil
        }
        return pickedSign
    }
    func getName() -> String? {
        guard let name = UserDefaults.standard.object(forKey: UserPreferenceKey.name) as? String else {
            return nil
        }
        return name
    }
}
