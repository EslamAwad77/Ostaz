//
//  StudentCourseVC.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

class StudentCourseVC: UIViewController {
    
    var courses: [CourseModel] = []
    
    @IBOutlet weak var tblViewStudentCource: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        tblViewStudentCource.delegate = self
        tblViewStudentCource.dataSource = self
        tblViewStudentCource.register(UINib.init(nibName: "StudentCoursesViewCell", bundle: nil), forCellReuseIdentifier: "StudentCoursesViewCell")
        tblViewStudentCource.reloadData()
    }
}

extension StudentCourseVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = courses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCoursesViewCell", for: indexPath) as! StudentCoursesViewCell
//        if (item.catName.isEmpty && item.count == 0) {
//            cell.lblCategoryName.text = "no teacher job"
//            cell.imgViewCategory.image = UIImage.init(named: "WishListPic2")
//        } else {
//            cell.lblCategoryName.text = item.categories[0].categoryName
//            cell.imgViewCategory.kf.indicatorType = .activity
//            if let url = URL(string: item.categories[0].categoryImage){
//                cell.imgViewCategory.kf.setImage(with: url)
//            }else {
//                cell.imgViewCategory.image = UIImage.init(named: "WishListPic2")
//            }
//        }
        cell.lblCourseName.text = item.courseName
        cell.lblCourseDate.text = item.date
        cell.lblCourseDuration.text = item.duration
        cell.lblCoursePrice.text = item.price
        
        return cell
    }
}
