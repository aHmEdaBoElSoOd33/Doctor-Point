//
//  SplashVC.swift
//  OnBoardingScreen
//
//  Created by Ahmed on 25/02/2023.
//

import UIKit

class SplashVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.standard.set(false, forKey: "onBoardingViewed")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
            
            print(1)
            
            if UserDefaults.standard.bool(forKey: "logged"){
                let vc = self.storyboard?.instantiateViewController(identifier: NavHostVC.ID) as! NavHostVC
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            }
              
            if UserDefaults.standard.bool(forKey: "onBoardingViewed") {
                
                let vc = self.storyboard?.instantiateViewController(identifier: BeforeLoginScreen.ID) as! BeforeLoginScreen
                
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
                 
                
            }else{
                let vc = self.storyboard?.instantiateViewController(identifier: OnBoardingVC.ID) as! OnBoardingVC
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        } 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
