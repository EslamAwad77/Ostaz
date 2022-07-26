//
//  SubCategoryVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 17/07/2022.
//

import UIKit

class SubCategoryVC: UIViewController {
    
    //-------------------Variables------------------------
    var category_id: Int = 0
    var subCategoriesSlides: [CollectionViewCategorySlide] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblErrorDescrip: UILabel!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var collectionViewSubCategory: UICollectionView!
    @IBOutlet weak var viewRealoding: UIView!
    
    //-------------------Actions------------------------
 
    @IBAction func btnBackToCategory(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSearchCategoryResult(_ sender: Any) {
    }
    
    @IBAction func btnReloadingDataPressed(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setUpAPI()
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
}
