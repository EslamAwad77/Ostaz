//
//  WishlistVC+TableView.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/07/2022.
//

import UIKit

extension WishListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishListitem = wishListItems[indexPath.row]
        let cell = tbleViewWishList.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as! WishListCell

        cell.lblTeacherName.text = wishListitem.name
        cell.imgViewTeacher.kf.indicatorType = .activity
        if let url = URL(string: wishListitem.image){
            cell.imgViewTeacher.kf.setImage(with: url)
        }else {
            cell.imgViewTeacher.image = UIImage.init(named:  "FailGoToTeacherImage")
        }
        
        if (wishListitem.teacherCategory.isEmpty && wishListitem.teacherCategory.count == 0) {
            cell.lblTeacherJob.text = "no teacher job"
            cell.imgViewDecription.image = UIImage.init(named:  "FailGoToTeacherImage")
            cell.imgViewDecription.roundedImage()
        } else {
            cell.lblTeacherJob.text = wishListitem.teacherCategory[0].categoryName
            cell.imgViewDecription.kf.indicatorType = .activity
            
            if let url = URL(string: wishListitem.teacherCategory[0].categoryImage){
                cell.imgViewDecription.kf.setImage(with: url)
                cell.imgViewDecription.roundedImage()
            }else {
                cell.imgViewDecription.image = UIImage.init(named:  "FailGoToTeacherImage")
                cell.imgViewDecription.roundedImage()
            }
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wishListitem = wishListItems[indexPath.row]
        wishListPrefered.id = wishListitem.id
    }
}
