//
//  NavHostVC.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 26/02/2023.
//

import UIKit

class NavHostVC: UIViewController {
 
    @IBOutlet weak var nav5Btn: UIButton!
    @IBOutlet weak var nav4Btn: UIButton!
    @IBOutlet weak var nav3Btn: UIButton!
    @IBOutlet weak var nav2Btn: UIButton!
    @IBOutlet weak var nav1Btn: UIButton!
    @IBOutlet weak var hostView: UIView!
    
    
    static var ID = String(describing: NavHostVC.self)
    var lastSender = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        replaceV(HomeVC.ID)
        nav1Btn.isSelected = true
    }
    
    @objc func replaceV(_ ID:String){
        ViewEmbeder.embed(vcID: ID, parent: self, container: hostView) 
    }
    
    
//    func toggle(_ sender:UIButton){
//        sender.setImage(sender.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
//        sender.tintColor = UIColor(named: "green")
//
//
//    }
    
    
    
 
    @IBAction func navBtn(_ sender: UIButton) {
        
        if let lastPressedBtn:UIButton = view.viewWithTag(lastSender) as? UIButton{
//            lastPressedBtn.setImage(lastPressedBtn.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
//            //lastPressedBtn.tintColor = UIColor(named: "gray")
            lastPressedBtn.isSelected = false
        }

        
        switch sender.tag{
        case 1:
            sender.isSelected = true
            replaceV(HomeVC.ID)
             
        case 2: 
            sender.isSelected = true
            replaceV(NotificationVC.ID)
        case 3:
        
            sender.isSelected = true
            replaceV(SearchVC.ID)
 
        case 4:
           
            sender.isSelected = true
            replaceV(DocumentsVC.ID)
        default:
            sender.isSelected = true
            replaceV(SettingsVC.ID)
           
        }
        lastSender = sender.tag
        print(lastSender)
    }
    
}
