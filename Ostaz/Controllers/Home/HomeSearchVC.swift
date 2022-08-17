//
//  HomeSearchVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import UIKit

class HomeSearchVC: UIViewController {
    
    //-------------------variables------------------------
    var searchItems: [HomeMostViewedModel] = []
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var signupView: SignupView!
    @IBOutlet weak var tableViewSearchResult: UITableView!
    
    //-------------------IBAction------------------------
    @IBAction func btnBackToHomeVC(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //-------------------lifecycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //-------------------functions------------------------
    func setupUI() {
        tableViewSearchResult.dataSource = self
        tableViewSearchResult.delegate = self
        self.tableViewSearchResult.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        tableViewSearchResult.reloadData()
    }
}

//-------------------extension------------------------
extension HomeSearchVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchItem = searchItems[indexPath.row]
        let cell = tableViewSearchResult.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
