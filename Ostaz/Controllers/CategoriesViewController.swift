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
        self.viewSearch.addBorder(.top, color: UIColor.systemGray5, thickness: 1)
        self.viewSearch.addBorder(.bottom, color: UIColor.systemGray5, thickness: 1)
        self.viewSearch.addBorder(.left, color: UIColor.systemGray5, thickness: 1)
        self.viewSearch.addBorder(.right, color: UIColor.systemGray5, thickness: 1)
    }
}
