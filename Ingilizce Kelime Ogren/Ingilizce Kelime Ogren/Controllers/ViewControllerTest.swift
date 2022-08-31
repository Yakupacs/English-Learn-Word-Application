//
//  ViewControllerTest.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit

class ViewControllerTest: UIViewController {

    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var aBtn: UIButton!
    @IBOutlet weak var bBtn: UIButton!
    @IBOutlet weak var cBtn: UIButton!
    @IBOutlet weak var dBtn: UIButton!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var logoutButtonn: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userUsername: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionButton.layer.cornerRadius = 15
        pageView.layer.cornerRadius = 15
        userImage.layer.cornerRadius = 30
        aBtn.layer.cornerRadius = 15
        dBtn.layer.cornerRadius = 15
        logoutButtonn.setImage(UIImage(named: "logout"), for: .normal)
        logoutButtonn.imageView?.contentMode = .scaleAspectFill
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! ViewControllerTabBar
        userUsername.text = tabbar.sendUsername
        userImage.image = tabbar.sendImage
    }
    
    
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
}
