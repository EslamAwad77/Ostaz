//
//  UserDefaultsManager.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 15/08/2022.
//

import Foundation

class UserDefaultsManager{
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    
   
    
    var password: String{
        set{
            defaults.setValue(newValue, forKey: "password")
        }get{
            return defaults.string(forKey: "password")!
        }
    }
}
