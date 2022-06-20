//
//  ViewController.swift
//  Inventory_System
//
//  Created by Athalia Gracia Santoso on 20/06/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    let database=Firestore.firestore()
    private let label:UILabel={
        let label=UILabel()
        label.textAlignment = .center
        label.numberOfLines=0
        return label
    }()
    private let field: UITextField={
        let field = UITextField()
        field.placeholder="Enter text"
        field.layer.borderWidth=1
        field.layer.borderColor=UIColor.black.cgColor
        return field
    }()
    
    @IBOutlet weak var emailfield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    @IBAction func addEmail(_ sender: UIButton) {
        print("clicked")
        guard let email=emailfield.text,!email.isEmpty,
        let password=passwordfield.text,!password.isEmpty else{
            print("Missing field data")
            return
        }
    }
    var email=""
    var password=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        view.addSubview(label)
//        view.addSubview(field)
//        field.delegate=self
        
//        FirebaseAuth.Auth.auth().signIn(withEmail: email, link: password,completion: {[weak self]result, error in
//
//            guard let strongSelf=self else{
//                return
//            }
//            guard error == nil else{
//                //show acc creation
//                strongSelf.showCreateAccount(email: self!.email, password: self!.password)
//                return
//            }
//            print("signed in")
//        })
        
//        let docRef = database.document("inventory/example")
//        docRef.getDocument{
//            snapshot,error in
//            guard let data = snapshot?.data(), error == nil else{
//                return
//            }
//            print(data)
//        }
                
        // Do any additional setup after loading the view.
    }
    
//    func showCreateAccount(email:String, password:String){
//        let alert = UIAlertController(title: "Create", message: "Create acc?", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
//            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password,completion: {[weak self] result,error in
//                guard let strongSelf=self else{
//                    return
//                }
//                guard error == nil else{
//                    //show acc creation
//
//                    return
//                }
//                print("signed in")
//            })
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in }))
//    }
    
    func writeData(text:String){
        let docRef = database.document("inventory/example")
        docRef.setData(["text": text])
    
    }
    override func viewDidLayoutSubviews() {
        field.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10, width: view.frame.size.width-20, height: 50)
        label.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10+60, width: view.frame.width-20, height: 100)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text=textField.text,!text.isEmpty{
            writeData(text: text)
        }
        return true
    }


}

