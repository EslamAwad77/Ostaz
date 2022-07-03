//
//  HomeSearchVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/06/2022.
//

import UIKit

class HomeSearchVC: UIViewController {
    
    //-------------------variables------------------------
    var searchItems: [WishListItems] = [
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ahmed", teacherJob: "maths"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ali", teacherJob: "arabic"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour", teacherJob: "region"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)")
    ]
    
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
        cell.imgViewDecription.image = searchItem.descriptionImg
        cell.imgViewTeacher.image = searchItem.teacherImg
        cell.lblTeacherName.text = searchItem.teacherName
        cell.lblTeacherJob.text = searchItem.teacherJob
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
