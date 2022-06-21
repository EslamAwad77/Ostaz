//
//  SportsViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 14/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    
    //-------------------variables------------------------

    var sportsItems: [WishListItems] = [
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ahmed", teacherJob: "maths"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "ali", teacherJob: "arabic"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour", teacherJob: "region"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),
        WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic2"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)"),WishListItems(descriptionImg: #imageLiteral(resourceName: "WishListPic1"), teacherImg: #imageLiteral(resourceName: "TeacherImage"), teacherName: "nour ahmed mohamed", teacherJob: "region(maths)")
    ]
    
    //-------------------IBOutlet------------------------

    @IBOutlet weak var tbleViewSports: UITableView!
    
    //-------------------lifecycle------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //-------------------functions------------------------

    func setupUI() {
        tbleViewSports.dataSource = self
        tbleViewSports.delegate = self
        self.tbleViewSports.register(UINib.init(nibName: "WishListCell", bundle: nil), forCellReuseIdentifier: "WishListCell")
        tbleViewSports.reloadData()
    }
}

//-------------------extension------------------------

extension SportsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sportsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sportItem = sportsItems[indexPath.row]
        let cell = tbleViewSports.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell
        cell.imgViewDecription.image = sportItem.descriptionImg
        cell.imgViewTeacher.image = sportItem.teacherImg
        cell.lblTeacherName.text = sportItem.teacherName
        cell.lblTeacherJob.text = sportItem.teacherJob
        return cell
    }
}
