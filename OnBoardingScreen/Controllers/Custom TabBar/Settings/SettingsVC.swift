//
//  SettingsVC.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 01/03/2023.
//

import UIKit

class SettingsVC: UIViewController {

    static var ID = String(describing: SettingsVC.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
 
    @IBAction func logOutBtn(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "logged")
        
        let vc = storyboard?.instantiateViewController(identifier: BeforeLoginScreen.ID) as! BeforeLoginScreen
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
}
