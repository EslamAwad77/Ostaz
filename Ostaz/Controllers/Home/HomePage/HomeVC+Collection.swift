//
//  HomeVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//


import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewPiadInstInHome{
            return homePaidInstructorsSlides.count
        } else if collectionView == self.collectionViewMostViewedInHome{
            return homeMostViewedSlides.count
        }
        return homecategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewPiadInstInHome{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: HomePaidInstCollectionViewCell.identifier, for: indexPath) as! HomePaidInstCollectionViewCell
            cell1.setupUI(homePaidInstructorsSlides[indexPath.row])
            return cell1
        } else if collectionView == self.collectionViewMostViewedInHome {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMostViewedCollectionViewCell.identifier, for: indexPath) as! HomeMostViewedCollectionViewCell
            cell2.setup(homeMostViewedSlides[indexPath.row])
            return cell2
        } else {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoriesCollectionViewCell.identifier, for: indexPath) as! HomeCategoriesCollectionViewCell
            cell3.setupUI (homecategoriesSlides[indexPath.row])
            return cell3
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewPiadInstInHome{
            let teacherVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherProfileViewController") as! TeacherProfileViewController
            teacherVC.modalPresentationStyle = .fullScreen
            self.present(teacherVC, animated: true)
            //            let item = homeMostViewedSlides[indexPath.row]
            
        } else if  collectionView == self.collectionViewMostViewedInHome{
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
        if collectionView == self.collectionViewPiadInstInHome{
            return CGSize(width: collectionView.frame.width*0.6, height: collectionView.frame.height)
        } else if collectionView == self.collectionViewMostViewedInHome{
            return CGSize(width: collectionView.frame.width*0.6, height: collectionView.frame.height)
        }
        return CGSize(width: collectionView.frame.width/3.5, height: 95)
    }
}
