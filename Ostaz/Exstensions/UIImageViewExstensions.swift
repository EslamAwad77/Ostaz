//
//  UIImageViewExstensions.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/07/2022.
//

import UIKit

extension UIImageView {
    func roundedImage() {
         self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.layer.cornerRadius = (self.frame.size.height) / 2;
         self.clipsToBounds = true
         //self.layer.borderWidth = 3.0
         //self.layer.borderColor = UIColor.white.cgColor
     }
}
