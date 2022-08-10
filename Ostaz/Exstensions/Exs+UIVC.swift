//
//  Exs+UIVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 10/08/2022.
//

import UIKit


extension UIViewController {
    func showAlert(message: String){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
