//
//  LocationViewController.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/06/2022.
//

import UIKit
import DropDown

class LocationViewController: UIViewController{
    
    //-------------------Variables------------------------
    let cityDropDown = DropDown()
    let areaDropDown = DropDown()
    let cityValues: [String] = ["alex", "mans"]
    let areaValues: [String] = ["alex library", "samia elgamal"]
    
    //-------------------Outlet---------------------------
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewArea: UIView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    
    //-------------------Actions--------------------------
    @IBAction func btnSelectCity(_ sender: UIButton) {
        cityDropDown.show()
    }
    
    @IBAction func btnSelectArea(_ sender: UIButton) {
        areaDropDown.show()
    }
    
    @IBAction func btnConfirmLocation(_ sender: UIButton) {
        self.goToLoginVC()
    }
    
    //-------------------LifeCycle------------------------
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setUpUI()
    }
    
    //-------------------functions------------------------
    
    func setUpUI(){
        cityDropDown.anchorView = viewCity
        cityDropDown.dataSource = cityValues
        areaDropDown.anchorView = viewArea
        areaDropDown.dataSource = areaValues
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(cityDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.bottomOffset = CGPoint(x: 0, y:(areaDropDown.anchorView?.plainView.bounds.height)!)
        areaDropDown.topOffset = CGPoint(x: 0, y:-(areaDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.direction = .any
        areaDropDown.direction = .any
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblCity.text = cityValues[index]
        }
        areaDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblArea.text = areaValues[index]
        }
    }
    
    func goToLoginVC(){
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
}
