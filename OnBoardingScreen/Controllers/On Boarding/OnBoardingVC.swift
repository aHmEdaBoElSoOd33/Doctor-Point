//
//  ViewController.swift
//  OnBoardingScreen
//
//  Created by Ahmed on 25/02/2023.
//

import UIKit
 
class OnBoardingVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
   
    
    @IBOutlet weak var slidingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
     
    var slideImgs = ["onboard1","onboard2","onboard3",]
    var slideTitles = ["Thousands of doctors","Live talk with doctor", "Chat with doctors"]
    var slideDesc = ["Access thousands of Doctors instantly. You can easily contact with the doctors and contact for your needs.", "Easily connect with doctor and start video chat for your better treatment & Prescription.", "Book an appointment with doctor. Chat with doctor via appointment letter. Get consultent."]
    static var ID = String(describing: OnBoardingVC.self)
    var slider : [Slide] = []
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slider.count - 1 {
                skipBtn.isHidden = false
                getStartedBtn.setTitle("Get Started", for: .normal)
            }else{
                skipBtn.isHidden = true
                getStartedBtn.setTitle("Next", for: .normal)
            }
        }
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0...slideTitles.count - 1{
            
            slider.append(Slide(slideImage: slideImgs[i], slideTitle: slideTitles[i], slideDescrebtion: slideDesc[i]))
            
        }
        
        slidingCollectionView.delegate = self
        slidingCollectionView.dataSource = self
    }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return slider.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.ID, for: indexPath) as! OnboardingCollectionViewCell
            cell.slideImage.image = UIImage(named:slider[indexPath.row].slideImage!)
            cell.slideTitle.text = slider[indexPath.row].slideTitle
            cell.slidedescribtion.text = slider[indexPath.row].slideDescrebtion
              
            return cell
        }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slidingCollectionView.bounds.width, height: slidingCollectionView.bounds.height)
    }
    
//    if currentPage == slides.count - 1{
//        print("Navigate")
//    }else{
//        currentPage += 1
//        let indexPath = IndexPath(item: currentPage, section: 0)
//        slidesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//    }
    @IBAction func skipBtnAction(_ sender: Any) { 
        let vc = storyboard?.instantiateViewController(identifier: NavHostVC.ID) as! NavHostVC
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    
    @IBAction func getStarted(_ sender: Any) {
        if currentPage == slider.count - 1 {
            let vc = storyboard?.instantiateViewController(identifier: BeforeLoginScreen.ID) as! BeforeLoginScreen
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
            UserDefaults.standard.set(true, forKey: "onBoardingViewed")
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            slidingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

