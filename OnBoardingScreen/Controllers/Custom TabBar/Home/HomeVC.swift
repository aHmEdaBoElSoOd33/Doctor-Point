//
//  HomeVC.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 26/02/2023.
//

import UIKit

class HomeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    

    @IBOutlet weak var topDoctorCollectionView: UICollectionView!
    
    @IBOutlet weak var specialistCollectionView: UICollectionView!
    
    @IBOutlet weak var specialistSecondCollectionView: UICollectionView!
    
    
    static var ID = String(describing: HomeVC.self)
    var specialty = ["Cardio Specialist" ,
                     "Heart Issue",
                     "Dental Care" ,
                      "Physico Therapy"] 
    var doctorCount = ["27 Doctors",
                       "43 Doctors" ,
                       "19 Doctors",
                       "07 Doctors"]
    var color = ["green", "blue" , "orange" , "purble"]
    var specialyDescription = [" For cardio patient here can easily contact with doctor. Can chat & live chat.","For Dental patient here can easily contact with doctor. Can chat & live chat."]
    var specialtySecondCell = ["Cardio Specialist?","Dental Care?"]
    var price = ["100$","100$"]
    var topDoctors = ["Dr. Mahmud N",
                     "Dr. Daniela M",
                      "Dr. Carmen H"]
    var topDoctorSpecialist = ["Heart Sergon",
                              "Cardio Sergon",
                               "Dental Sergon"]
    
    var specialtyArray : [Specialty] = []
    var specialtyArray2 : [SecondSpecialsty] = []
    var topDoctorArray : [Doctor] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupUI(){
        
         
         print(specialtyArray)
         print( specialtyArray2)
         specialistCollectionView.delegate = self
         specialistCollectionView.dataSource = self
         
         specialistSecondCollectionView.delegate = self
         specialistSecondCollectionView.dataSource = self
         
         topDoctorCollectionView.dataSource = self
         topDoctorCollectionView.delegate = self
         
         setupCollectioViewCell(for: specialistCollectionView, ID: specialistCollectionViewCell.ID)
         setupCollectioViewCell(for: specialistSecondCollectionView ,ID: SecondspecialistCollectionViewCell.ID)
         setupCollectioViewCell(for: topDoctorCollectionView, ID: TopDoctorCollectionViewCell.ID)
    }
    
    func setupCollectioViewCell(for collectionView:UICollectionView , ID :String){
        
        let nib = UINib(nibName: ID, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ID)
    }
    
    
    func setupData(){
        for i in 0...specialty.count-1 {
            specialtyArray.append(Specialty(speciltyImg: specialty[i], speciltyTite: specialty[i], doctorCount: doctorCount[i],color: color[i]))
        }
         
        for i in 0...specialtySecondCell.count-1{
            specialtyArray2.append(SecondSpecialsty(title:specialtySecondCell[i], desc: specialyDescription[i], price: price[i]))
        }
        
        for i in 0...topDoctors.count-1{
            topDoctorArray.append(Doctor(name: topDoctors[i], Img: topDoctors[i], specialty: topDoctorSpecialist[i]))
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        switch collectionView{
        case specialistCollectionView:
            return specialty.count
        case specialistSecondCollectionView:
            return specialtyArray2.count
        default:
           return topDoctorArray.count
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         switch collectionView{
         case specialistCollectionView:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialistCollectionViewCell.ID, for: indexPath) as! specialistCollectionViewCell
             cell.specialtyImage.image = UIImage(named: specialtyArray[indexPath.row].speciltyImg!)
             cell.specialtyTitle.text = specialtyArray[indexPath.row].speciltyTite
             cell.numberOfDoctors.text = specialtyArray[indexPath.row].doctorCount
             cell.backgroundColor = UIColor(named: specialtyArray[indexPath.row].color!)
              
             return cell
         case specialistSecondCollectionView:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondspecialistCollectionViewCell.ID, for: indexPath) as! SecondspecialistCollectionViewCell
             
             cell.price.text = specialtyArray2[indexPath.row].price
             cell.specialstyTitle.text = specialtyArray2[indexPath.row].title
             cell.specialistyDesc.text = specialtyArray2[indexPath.row].desc
             cell.layer.borderWidth = 0.2
             cell.layer.borderColor = UIColor.darkGray.cgColor
             print( "i'm here")
             return cell
         default:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopDoctorCollectionViewCell.ID, for: indexPath) as! TopDoctorCollectionViewCell
             cell.doctorImage.image = UIImage(named: topDoctorArray[indexPath.row].Img!)
             cell.doctorName.text = topDoctorArray[indexPath.row].name
             cell.doctorSpecialty.text = topDoctorArray[indexPath.row].specialty
             cell.layer.borderWidth = 0.2
             cell.layer.borderColor = UIColor.darkGray.cgColor
             return cell
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView{
        case specialistCollectionView:
            return CGSize(width: 90, height: 140)
        case specialistSecondCollectionView:
            return CGSize(width: 290, height: 120)
        default:
            return CGSize(width: 130, height: 190)
        }
        
    }
     
    

}
