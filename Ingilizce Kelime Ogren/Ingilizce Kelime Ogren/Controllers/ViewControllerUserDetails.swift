//
//  ViewControllerUserDetails.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 9/1/22.
//

import UIKit

class ViewControllerUserDetails: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword1: UITextField!
    @IBOutlet weak var txtPassword2: UITextField!
    @IBOutlet weak var buttonChangePassword: UIButton!
    @IBOutlet weak var buttonUpdate: UIButton!
    
    var personalID : UUID?
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userImage.layer.cornerRadius = 77
        buttonUpdate.layer.cornerRadius = 15
        buttonChangePassword.layer.cornerRadius = 15
        
        let tabbar = tabBarController as! ViewControllerTabBar
        personalName = tabbar.sendName
        personalSurname = tabbar.sendSurname
        personalUsername = tabbar.sendUsername
        personalPassword = tabbar.sendPassword
        personalImage = tabbar.sendImage
        personalID = tabbar.sendID
        
        txtName.text = personalName
        txtSurname.text = personalSurname
        txtUsername.text = personalUsername
        userImage.image = personalImage

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        txtPassword1.isHidden = true
        txtPassword2.isHidden = true
        buttonUpdate.isHidden = true
    }
    
    @IBAction func passwordChangeFunc(_ sender: Any) {
        txtPassword1.isHidden = false
        txtPassword2.isHidden = false
        buttonUpdate.isHidden = false
        
    }
    

}
