//
//  CategoriesVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 21/07/2022.
//

import UIKit

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        cell.setupUI(filteredCategoriesSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = categoriesSlides[indexPath.row]
        let subCategoryVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
        subCategoryVC.modalPresentationStyle = .fullScreen
        subCategoryVC.category_id = item.categoryId
        self.present(subCategoryVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: 106)
    }
}
