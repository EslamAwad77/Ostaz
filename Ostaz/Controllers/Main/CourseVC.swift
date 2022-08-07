//
//  CourseVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit
import Kingfisher

class CourseVC: UIViewController{
   
    
    var courses: [CourseModel] = [CourseModel]()
    
    @IBOutlet weak var tblViewCourses: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        tblViewCourses.delegate = self
        tblViewCourses.dataSource = self
        tblViewCourses.register(UINib.init(nibName: "CourseViewCell", bundle: nil), forCellReuseIdentifier: "CourseViewCell")
        tblViewCourses.reloadData()
    }
    /*
     func goToRegister(){
         self.signUpView.didClickButton = { [weak self] in
             guard let self = self else{return}
             print("did Clicked ")
             let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
             let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
             registerVC.modalPresentationStyle = .fullScreen
             self.present(registerVC, animated: true)
         }
     }
     */
}


extension CourseVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = courses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseViewCell", for: indexPath) as! CourseViewCell
        if (item.categories.isEmpty && item.categories.count == 0) {
            cell.lblCategoryAndSubCategory.text = "no teacher job"
            cell.imgViewCategory.image = UIImage.init(named: "WishListPic2")
        } else {
            cell.lblCategoryAndSubCategory.text = item.categories[0].categoryName
            cell.imgViewCategory.kf.indicatorType = .activity
            if let url = URL(string: item.categories[0].categoryImage){
                cell.imgViewCategory.kf.setImage(with: url)
            }else {
                cell.imgViewCategory.image = UIImage.init(named: "WishListPic2")
            }
        }
        cell.lblCourceName.text = item.courseName
        return cell
    }
}
