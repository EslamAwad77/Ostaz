//
//  HomeVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewMostViewedInHome{
            return homeMostViewedSlides.count
        }
        return homecategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewMostViewedInHome{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMostViewedCollectionViewCell.identifier, for: indexPath) as! HomeMostViewedCollectionViewCell
            cell1.setup(homeMostViewedSlides[indexPath.row])
            return cell1
        } else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoriesCollectionViewCell.identifier, for: indexPath) as! HomeCategoriesCollectionViewCell
            cell2.setupUI (homecategoriesSlides[indexPath.row])
            
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewMostViewedInHome{
            let teacherVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherProfileViewController") as! TeacherProfileViewController
            teacherVC.modalPresentationStyle = .fullScreen
            self.present(teacherVC, animated: true)
            //            let item = homeMostViewedSlides[indexPath.row]
        } else{
            let item = homecategoriesSlides[indexPath.row]
            let subCategoryVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
            subCategoryVC.modalPresentationStyle = .fullScreen
            subCategoryVC.category_id = item.categoryId
            self.present(subCategoryVC, animated: true)
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewMostViewedInHome{
            return CGSize(width: collectionView.frame.width*0.6, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width/3.5, height: 95)
        }
    }
}
