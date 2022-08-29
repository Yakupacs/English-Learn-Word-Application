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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionButton.layer.cornerRadius = 15
        pageView.layer.cornerRadius = 15
        aBtn.layer.cornerRadius = 15
        dBtn.layer.cornerRadius = 15
        logoutButtonn.setImage(UIImage(named: "logout"), for: .normal)
        logoutButtonn.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
}
