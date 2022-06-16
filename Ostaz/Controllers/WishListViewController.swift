//
//  WishListViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class WishListViewController: UIViewController {
    
    var wishListItems: [WishListItems] = [
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ahmed Mohmaed ali", teacherJob: "maths (maths)"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ali ahmed mohamed", teacherJob: "arabic(maths)"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)")
    ]
    
    @IBOutlet weak var tbleViewWishList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    func setupUI() {
        tbleViewWishList.dataSource = self
        tbleViewWishList.delegate = self
        self.tbleViewWishList.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        tbleViewWishList.reloadData()
    }

}

extension WishListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishListitem = wishListItems[indexPath.row]
        let cell = tbleViewWishList.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell
        cell.imgViewDecription.image = wishListitem.descriptionImg
        cell.imgViewTeacher.image = wishListitem.teacherImg
        cell.lblTeacherName.text = wishListitem.teacherName
        cell.lblTeacherJob.text = wishListitem.teacherJob
        return cell
    }
}
