//
//  LocationVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 19/07/2022.
//
//
import UIKit

extension LocationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collViewCity{
            return cityValues.count
        }
        return areaValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collViewCity{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier:LocationCollViewCell.identifier, for: indexPath) as! LocationCollViewCell
            
            cell1.userCity = selectedCity[indexPath.row]
            cell1.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedCity.removeAll { item in
                    if item.name == cell1.userCity?.name {
                        return true
                    }
                    return false
                }
                self.collViewCity.isHidden = self.selectedCity.isEmpty
                self.collViewCity.reloadData()
            }
            return cell1
        } else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollViewCell.identifier, for: indexPath) as! LocationCollViewCell
            cell2.userArea = selectedArea[indexPath.row]
            cell2.didDeleted = { [weak self] in
                guard let self  = self else {return }
                self.selectedArea.removeAll { item in
                    if item.name == cell2.userArea?.name {
                        return true
                    }
                    return false
                }
                self.collViewArea.isHidden = self.selectedArea.isEmpty
                self.collViewArea.reloadData()
            }
            return cell2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collViewCity{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        } else{
            return CGSize(width: collectionView.frame.width*0.315, height: 33)
        }
    }
}
