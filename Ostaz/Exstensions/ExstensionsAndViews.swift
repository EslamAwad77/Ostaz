//
//  ExstensionsAndViews.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 07/06/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRaduis: CGFloat {
        get{
            return self.cornerRaduis
        } set{
            self.layer.cornerRadius = newValue
        }
    }
    
    func addborder(_ withValue: CGFloat,_ borWidth: CGFloat? = nil, color: UIColor? = nil){
        self.layer.cornerRadius = withValue
        self.layer.borderWidth = borWidth ?? 1
        self.layer.borderColor = color?.cgColor ?? UIColor.systemGray5.cgColor
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

















//    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat){
//        let subView = UIView()
//        subView.translatesAutoresizingMaskIntoConstraints = false
//        subView.backgroundColor = color
//        self.addSubview(subView)
//
//        switch edge{
//        case .top, .bottom:
//            subView.cornerRaduis = 10
//            subView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//            subView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//            subView.heightAnchor.constraint(equalToConstant: thickness).isActive = true
//            if edge == .top{
//                subView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//            } else{
//                subView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//            }
//
//        case .left, .right:
//            subView.cornerRaduis = 10
//            subView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//            subView.widthAnchor.constraint(equalToConstant: thickness).isActive = true
//            if edge == .left{
//                subView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//            } else{
//                subView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//            }
//        default:
//            break
//        }
//    }

//    func round(_ cornerRaduis: CGFloat){
//        layer.cornerRadius = cornerRaduis
//        clipsToBounds = true
//    }

