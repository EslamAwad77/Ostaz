//
//  TeacherProfileVC+Collection.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//


import UIKit

extension TeacherProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewMehtods{
            return TeacherMethodsSlides.count
        } else if collectionView == self.collectionViewAreas {
            return TeacherAreasSlides.count
        }
        return TeachercategoriesSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewMehtods{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherProfileCollectionViewCell.identifier, for: indexPath) as! TeacherProfileCollectionViewCell
            cell1.setupUIMehtods(TeacherMethodsSlides[indexPath.row])
            return cell1
        } else if collectionView == self.collectionViewAreas{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherProfileCollectionViewCell.identifier, for: indexPath) as! TeacherProfileCollectionViewCell
            cell2.setupUIAreas(TeacherAreasSlides[indexPath.row])
            return cell2
        } else{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherProfileCollectionViewCell.identifier, for: indexPath) as! TeacherProfileCollectionViewCell
            cell3.setupUICategories(TeachercategoriesSlides[indexPath.row])
            return cell3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewMehtods{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else if collectionView == self.collectionViewAreas{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewMehtods{
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        } else if collectionView == self.collectionViewAreas {
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        } else {
            //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true)
        }
    }
}

