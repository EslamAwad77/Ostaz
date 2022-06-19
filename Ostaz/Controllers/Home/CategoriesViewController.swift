//
//  CategoriesViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var viewSearch: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSearch.addborder(10)
    }
}
