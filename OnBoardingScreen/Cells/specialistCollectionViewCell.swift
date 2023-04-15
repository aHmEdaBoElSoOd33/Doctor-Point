//
//  specialistCollectionViewCell.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 26/02/2023.
//

import UIKit

class specialistCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numberOfDoctors: UILabel!
    @IBOutlet weak var specialtyTitle: UILabel!
    @IBOutlet weak var specialtyImage: UIImageView!
    
    static var ID = String(describing: specialistCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

}
