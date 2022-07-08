//
//  Config.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 02/07/2022.
//

import Foundation

struct URLs {
    static let main = "https://inst.roqay.solutions/api/"
    /// POST {email, password}
    static let login = main + "login"
    /// POST {name, email, password, config-Password }
    static let register = main + "register"
    /// GET {}
    static let logout = main + "logout"
    /// POST {email}
    static let froget = main + "forget-password"
    /// POST {Otp, Password, Confirm_Password}
    static let reset = main + "reset-password"
}
