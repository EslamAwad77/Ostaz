//
//  SportsViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    
    //-------------------variables------------------------
    var subCategory_id: Int = 0
    var InstsOfSubCat = [UserModel]()
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var tbleViewSports: UITableView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var lblErrorDesc: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnReloadingData(_ sender: UIButton) {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.getData()
    }
    
    @IBAction func btnBackToCategories(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //-------------------lifecycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //-------------------functions------------------------
    func setupUI() {
        self.loadingData()
        self.activityLoadingPage.startAnimating()
        self.setupTableRefresh()
        tbleViewSports.dataSource = self
        tbleViewSports.delegate = self
        self.tbleViewSports.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        tbleViewSports.reloadData()
    }
    
    func getData(){
        APICategory.fetchingInstOfSubCategory(id: subCategory_id) { error, response in
            if error != nil {
                self.tbleViewSports.alpha = 0
                self.viewReloading.alpha = 1
                self.lblErrorDesc.alpha = 1
                self.lblErrorDesc.text = error
                print(error!)
               
            } else {
                self.activityLoadingPage.stopAnimating()
                self.hideError()
                self.lblErrorDesc.alpha = 0
                self.lblErrorDesc.text = ""
                print(response?.message ?? "")
            }
        }
    }
    
    func setupTableRefresh(){
        //if refresh from top
        self.tbleViewSports.es.addPullToRefresh { [weak self] in
            guard let self = self else { return }
            //self.APIUserProfile()
            print("top")
        }
    }
    
    func loadingData() {
        self.tbleViewSports.alpha = 0
        self.viewReloading.alpha = 0
    }
    
    
    func hideError() {
        self.tbleViewSports.alpha = 1
        self.viewReloading.alpha = 0
        self.activityLoadingPage.alpha = 0
    }
}

//-------------------extension------------------------

extension SportsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        InstsOfSubCat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = InstsOfSubCat[indexPath.row]
        let cell = tbleViewSports.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell
        cell.lblTeacherName.text = item.name
        cell.imgViewTeacher.kf.indicatorType = .activity
        if let url = URL(string: item.image){
            cell.imgViewTeacher.kf.setImage(with: url)
            cell.imgViewTeacher.roundedImage()
        }else {
            cell.imgViewTeacher.image = UIImage.init(named:  "TeacherImage")
            cell.imgViewTeacher.roundedImage()

        }
        
        if (item.teacherCategory.isEmpty && item.teacherCategory.count == 0) {
            cell.lblTeacherJob.text = "no teacher job"
            cell.imgViewDecription.image = UIImage.init(named:  "WishListPic2")
        } else {
            cell.lblTeacherJob.text = item.teacherCategory[0].categoryName
            cell.imgViewDecription.kf.indicatorType = .activity
            
            if let url = URL(string: item.teacherCategory[0].categoryImage){
                cell.imgViewDecription.kf.setImage(with: url)
            }else {
                cell.imgViewDecription.image = UIImage.init(named:  "WishListPic2")
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = InstsOfSubCat[indexPath.row]
        let teacherVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherProfileViewController") as! TeacherProfileViewController
        teacherVC.modalPresentationStyle = .fullScreen
        teacherVC.instructorId = item.id
        self.present(teacherVC, animated: true)
    }
}
