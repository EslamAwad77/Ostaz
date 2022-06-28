//
//  PromotionTeacherVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 28/06/2022.
//

import Foundation
import UIKit

extension PromotionForTeacherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewTeachMethods{
            return teacherMethodItems.count
        } else if collectionView == self.collectionViewAddingAreas {
            return selectedAreas.count
        }
        return selectedCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewTeachMethods{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier:TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell1.teachMethod = teacherMethodItems[indexPath.row]
            return cell1
        } else if collectionView == self.collectionViewAddingAreas{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier:TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
                
                cell2.teacherArea = selectedAreas[indexPath.row]
            cell2.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedAreas.removeAll { item in
                    if item.name == cell2.teacherArea?.name {
                        return true
                    }
                    return false
                }
                self.collectionViewAddingAreas.isHidden = self.selectedAreas.isEmpty
                self.collectionViewAddingAreas.reloadData()
            }
            return cell2
        } else{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherPromotionCollectionViewCell.identifier, for: indexPath) as! TeacherPromotionCollectionViewCell
            cell3.teacherCategory = selectedCategories[indexPath.row]
            cell3.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedCategories.removeAll { item in
                    if item.categoryName == cell3.teacherCategory?.categoryName {
                        return true
                    }
                    return false
                }
                self.collectionViewAddingCategories.isHidden = self.selectedCategories.isEmpty
                self.collectionViewAddingCategories.reloadData()
            }
            return cell3
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewTeachMethods{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else if collectionView == self.collectionViewAddingAreas{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        } else{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        }
    }
}
