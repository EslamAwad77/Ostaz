//
//  ExstensionsOfString.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 28/06/2022.
//

import Foundation
import CoreText

extension String {
    var trimmed: String{
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
