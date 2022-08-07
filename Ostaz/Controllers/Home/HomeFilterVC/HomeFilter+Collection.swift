//
//  HomeFilter+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/08/2022.
//

import UIKit

extension HomeFilterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collViewCategories{
            return selectedCategory.count
        } else if collectionView == self.collViewCitites {
            return selectedCity.count
        }
        return selectedArea.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collViewCategories{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier:HomeFilterCollViewCell.identifier, for: indexPath) as! HomeFilterCollViewCell
            
            cell1.userCategory = selectedCategory[indexPath.row]
            cell1.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedCategory.removeAll { item in
                    if item.categoryName == cell1.userCategory?.categoryName {
                        return true
                    }
                    return false
                }
                self.collViewCategories.isHidden = self.selectedCategory.isEmpty
                self.collViewCategories.reloadData()
            }
            return cell1
        } else if collectionView == self.collViewCitites {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier:HomeFilterCollViewCell.identifier, for: indexPath) as! HomeFilterCollViewCell
            
            cell2.userCity = selectedCity[indexPath.row]
            cell2.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedCity.removeAll { item in
                    if item.name == cell2.userCity?.name {
                        return true
                    }
                    return false
                }
                self.collViewCitites.isHidden = self.selectedCity.isEmpty
                self.collViewCitites.reloadData()
            }
            return cell2
        } else{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFilterCollViewCell.identifier, for: indexPath) as! HomeFilterCollViewCell
            cell3.userArea = selectedArea[indexPath.row]
            cell3.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedArea.removeAll { item in
                    if item.name == cell3.userArea?.name {
                        return true
                    }
                    return false
                }
                self.collViewAreas.isHidden = self.selectedArea.isEmpty
                self.collViewAreas.reloadData()
            }
            return cell3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collViewCategories{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        }else if collectionView == self.collViewCitites{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        }else{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        }
    }
}
