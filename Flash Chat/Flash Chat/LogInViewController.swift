//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import ProgressHUD
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        SVProgressHUD.show(withStatus: "loading log in")
        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print("!!!!!!!!!")
                print(error!)
                let bError = UIImage(named: "brendaError")
                ProgressHUD.imageError(bError)
                ProgressHUD.showError("No login found")
            }
            else {
                print("Sign in for \(self.emailTextfield.text!) successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
                SVProgressHUD.dismiss()
            }
        }
        
        
        
    }
    


    
}  
