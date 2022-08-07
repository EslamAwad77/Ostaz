//
//  SubCategoryVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 26/07/2022.
//

import UIKit

extension SubCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoryCollectionViewCell.identifier, for: indexPath) as! SubCategoryCollectionViewCell
        cell.setupUI(subCategoriesSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = subCategoriesSlides[indexPath.row]
        let sportsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SportsViewController") as! SportsViewController
        sportsVC.modalPresentationStyle = .fullScreen
        sportsVC.subCategory_id = item.categoryId
        self.present(sportsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: 106)
    }
}
