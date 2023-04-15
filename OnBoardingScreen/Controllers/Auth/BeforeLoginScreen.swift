//
//  ViewController.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 25/02/2023.
//

import UIKit
 

class BeforeLoginScreen: UIViewController {
    
    static var ID = String(describing: BeforeLoginScreen.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        }
         
        
        @IBAction func createAccountBtnAction(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(identifier: LoginAnSginUpVC.ID) as! LoginAnSginUpVC
            
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }
        
        @IBAction func signInBtnAction(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(identifier: LoginAnSginUpVC.ID) as! LoginAnSginUpVC
            vc.state = "SignIn"
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
            
            
        }
        
    }
