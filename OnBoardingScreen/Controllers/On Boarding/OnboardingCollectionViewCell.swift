//
//  OnboardingCollectionViewCell.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 25/02/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
      
    
    @IBOutlet weak var slidedescribtion: UILabel!
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    
    
    
    static var ID = String(describing: OnboardingCollectionViewCell.self)
}
