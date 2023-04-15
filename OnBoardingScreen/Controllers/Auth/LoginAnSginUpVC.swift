//
//  LoginAnSginUpVC.swift
//  OnBoardingScreens
//
//  Created by Ahmed on 26/02/2023.
//

import UIKit

class LoginAnSginUpVC: UIViewController {
    
    
    var state : String = ""
    
    @IBOutlet weak var showPasswordBtn: UIButton!
    @IBOutlet weak var sginInBtn: UIButton!
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var createAccountStackView: UIStackView!
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtFeild: UITextField!
    @IBOutlet weak var nameTxtFeild: UITextField!
    @IBOutlet weak var emailTxtfeild: UITextField!
    
    
    var email = "a@gmail.com"
    var password = "123123"
    var showPasswordBTnState = true
    static var ID = String(describing: LoginAnSginUpVC.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        
    }
    
    func setupUI(){
        
        if state == "SignIn"{
            signInSetUp()
            sginInBtn.setTitle("Sign In", for: .normal)
        }else{
            createAccountSetUp()
            sginInBtn.setTitle("Create account", for: .normal)
        }
        
    }
    
    func clearTxtField(){
        emailTxtfeild.text = ""
        passwordTxtField.text = ""
        phoneNumberTxtFeild.text = ""
        nameTxtFeild.text = ""
    }
    
    
    func validateSignIn(){
        
        guard let email = emailTxtfeild.text, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Email")
            return
        }
        
        guard let password = passwordTxtField.text, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Password")
            return
        }
        
        if emailTxtfeild.text == self.email && passwordTxtField.text == self.password {
            
            let vc = storyboard?.instantiateViewController(identifier: NavHostVC.ID) as! NavHostVC
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
            UserDefaults.standard.set(true, forKey: "logged")
            
        }else{
            showALert(message: "Wronge Email or Password")
        }
    }
    
    
    func validateSignUp(){
        
        guard let name = nameTxtFeild.text, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Username")
            return
        }
        
        guard let email = emailTxtfeild.text, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Email")
            return
        }
        
        guard let phone = phoneNumberTxtFeild.text, !phone.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Phone")
            return
        }
        guard let password = passwordTxtField.text, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            showALert(message: "please enter Password")
            return
        }
    }
    
    func signInSetUp(){
        nameStackView.isHidden = true
        phoneNumberStackView.isHidden = true
        signInStackView.isHidden = true
        forgetPasswordBtn.isHidden = false
        createAccountStackView.isHidden = false
    }
    
    func createAccountSetUp(){
        nameStackView.isHidden = false
        phoneNumberStackView.isHidden = false
        signInStackView.isHidden = false
        forgetPasswordBtn.isHidden = true
        createAccountStackView.isHidden = true
    }
    
    @IBAction func forgetPasswordBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func AlredyHaveAccountBtn(_ sender: Any) {
        clearTxtField()
        signInSetUp()
        sginInBtn.setTitle("Sign In", for: .normal)
    }
    
    @IBAction func HavntAnyAccountBtn(_ sender: Any) {
        clearTxtField() 
        createAccountSetUp()
        sginInBtn.setTitle("Create account", for: .normal)
    }
    @IBAction func signInBtn(_ sender: UIButton) {
       
        
        if sender.titleLabel?.text == "Sign In"{
            validateSignIn()
        }else{
            validateSignUp()
        }
        
        
        
    }
    
    
    
    @IBAction func showPasswordBtn(_ sender: UIButton) {
        if showPasswordBTnState {
            
            showPasswordBTnState = false
            showPasswordBtn.setImage(UIImage(named: "Eye Icon"), for: .normal)
            passwordTxtField.isSecureTextEntry = false
        }else{
            showPasswordBTnState = true
            showPasswordBtn.setImage(UIImage(named: "Eye Icon copy"), for: .normal)
            passwordTxtField.isSecureTextEntry = true
            
        }
        
    }
    
}
