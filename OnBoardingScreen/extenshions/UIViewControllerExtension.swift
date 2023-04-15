//
//  UIViewControllerExtension.swift
//  Doctor Point 
//
//  Created by Ahmed on 25/03/2023.
//

import Foundation
import UIKit



extension UIViewController{
    
    
    func showALert(message:String){
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    
}
