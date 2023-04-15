//
//  TopDoctorCollectionViewCell.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 27/02/2023.
//

import UIKit

class TopDoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var doctorSpecialty: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    
    
    static var ID = String(describing: TopDoctorCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
