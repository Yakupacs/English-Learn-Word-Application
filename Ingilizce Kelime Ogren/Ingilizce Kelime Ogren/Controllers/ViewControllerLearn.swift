//
//  ViewControllerLearn.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit

class ViewControllerLearn: UIViewController {

    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var englishLbl: UILabel!
    @IBOutlet weak var turkishLbl: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.layer.cornerRadius = 30
        yesButton.layer.cornerRadius = 30
        noButton.layer.cornerRadius = 30
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
    }
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            englishLbl.text = "Başlangıç İngilizce Kelime"
        case 1:
            englishLbl.text = "Orta İngilizce Kelime"
        case 2:
            englishLbl.text = "Zor İngilizce Kelime"
        case 3:
            englishLbl.text = "Kalıp Cümle"
        default:
            break
        }
    }
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    

}
