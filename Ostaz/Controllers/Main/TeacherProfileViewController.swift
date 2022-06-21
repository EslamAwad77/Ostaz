//
//  TeacherProfileViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 12/06/2022.
//

import UIKit

class TeacherProfileViewController: UIViewController {

    //-------------------Variables------------------------
    
    var TeacherMethodsSlides: [CollectionViewMethodsSlide] = []
    var TeacherAreasSlides: [CollectionViewAreasSlide] = []
    var TeachercategoriesSlides: [CollectionViewTeahcerCategoriesSlide] = []
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet weak var signUpView: SignupView!
    @IBOutlet weak var imgViewTeacher: UIImageView!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblTeacherPhone: UILabel!
    @IBOutlet weak var lblTeacherWhatsApp: UILabel!
    @IBOutlet weak var lblTeacherFacebookAccount: UILabel!
    @IBOutlet weak var collectionViewMehtods: UICollectionView!
    @IBOutlet weak var collectionViewAreas: UICollectionView!
    @IBOutlet weak var collectionViewCategoryy: UICollectionView!
    @IBOutlet weak var lblDescriptionText: UILabel!
    @IBOutlet weak var imgViewDescription: UIImageView!
    @IBOutlet weak var lblDescriptionJobName: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnReturnHome(_ sender: UIButton) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
    }
    
    @IBAction func btnAddToWishList(_ sender: Any) {
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    //-------------------Functions------------------------
    
    func setUpUI(){
        collectionViewMehtods.delegate = self
        collectionViewMehtods.dataSource = self
        collectionViewAreas.delegate = self
        collectionViewAreas.dataSource = self
        collectionViewCategoryy.delegate = self
        collectionViewCategoryy.dataSource = self
        //collectionViewHome.collectionViewLayout = UICollectionViewFlowLayout()
        TeacherMethodsSlides = [
            CollectionViewMethodsSlide(methodName: "Online", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Student Home", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Teacher Place", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Center", methodImage: #imageLiteral(resourceName: "RightMark")),
            CollectionViewMethodsSlide(methodName: "Groups", methodImage: #imageLiteral(resourceName: "RightMark"))
        ]
        TeacherAreasSlides = [
            CollectionViewAreasSlide(areaName: "Egypt", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Dakahlia", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Mansoura", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Samia El Gamal", areaImage: #imageLiteral(resourceName: "locationMark")),
            CollectionViewAreasSlide(areaName: "Ahmed Maher", areaImage: #imageLiteral(resourceName: "locationMark"))
        ]
        TeachercategoriesSlides = [
            CollectionViewTeahcerCategoriesSlide(categoryName: "Teaching", categoryImage: #imageLiteral(resourceName: "tagesMark")),
            CollectionViewTeahcerCategoriesSlide(categoryName: "Math", categoryImage: #imageLiteral(resourceName: "tagesMark")),
            CollectionViewTeahcerCategoriesSlide(categoryName: "Grade 6", categoryImage: #imageLiteral(resourceName: "tagesMark"))
        ]
    }
}

//-------------------Exstensions------------------------

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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewMehtods{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else if collectionView == self.collectionViewAreas{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        } else{
            return CGSize(width: collectionView.frame.width/2.5, height: 38)
        }
    }
}
