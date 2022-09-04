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
    @IBOutlet weak var logoutButtonn: UIButton!
    @IBOutlet weak var imageLogo: UIImageView!
    
    var personalID : UUID?
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalImage : UIImage?
    var personalWords : Dictionary = ["":""]
    
    var trueQuestion : String = ""
    var trueAnswer : String = ""
    var wrongAnswer1 : String = ""
    var wrongAnswer2 : String = ""
    var wrongAnswer3 : String = ""
    
    
    var buttons : [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [aBtn, bBtn, cBtn, dBtn]
        
        personalWords.removeValue(forKey: "")
        
        questionButton.layer.cornerRadius = 15
        aBtn.layer.cornerRadius = 10
        bBtn.layer.cornerRadius = 10
        cBtn.layer.cornerRadius = 10
        dBtn.layer.cornerRadius = 10
        logoutButtonn.setImage(UIImage(named: "logout"), for: .normal)
        logoutButtonn.imageView?.contentMode = .scaleAspectFill
        
        let tabbar = tabBarController as! ViewControllerTabBar
        personalID = tabbar.sendID
        personalImage = tabbar.sendImage
        personalName = tabbar.sendName
        personalSurname = tabbar.sendSurname
        personalUsername = tabbar.sendUsername
        personalPassword = tabbar.sendPassword
        personalWords = tabbar.sendWords
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aBtn.isHidden = false
        bBtn.isHidden = false
        cBtn.isHidden = false
        dBtn.isHidden = false
        let tabbar = tabBarController as! ViewControllerTabBar
        personalID = tabbar.sendID
        personalImage = tabbar.sendImage
        personalName = tabbar.sendName
        personalSurname = tabbar.sendSurname
        personalUsername = tabbar.sendUsername
        personalPassword = tabbar.sendPassword
        personalWords = tabbar.sendWords
        personalWords.removeValue(forKey: "")

        UIView.animate(withDuration: 0.25, delay: 0) {
            self.questionButton.frame.size.width += 345
        }
        UIView.animate(withDuration: 0.25, delay: 0.25) {
            self.aBtn.frame.size.width += 345
        }
        UIView.animate(withDuration: 0.25, delay: 0.5) {
            self.bBtn.frame.size.width += 345
        }
        UIView.animate(withDuration: 0.25, delay: 0.75) {
            self.cBtn.frame.size.width += 345
        }
        UIView.animate(withDuration: 0.25, delay: 1) {
            self.dBtn.frame.size.width += 345
        }
        
        if personalWords.count != 0{
            let indexTrue: Int = Int(arc4random_uniform(UInt32(personalWords.count)))
            trueQuestion = Array(personalWords.keys)[indexTrue]
            trueAnswer = Array(personalWords.values)[indexTrue]
            let indexFalse1: Int = Int(arc4random_uniform(UInt32(personalWords.count)))
            wrongAnswer1 = Array(personalWords.values)[indexFalse1]
            let indexFalse2: Int = Int(arc4random_uniform(UInt32(personalWords.count)))
            wrongAnswer2 = Array(personalWords.values)[indexFalse2]
            let indexFalse3: Int = Int(arc4random_uniform(UInt32(personalWords.count)))
            wrongAnswer3 = Array(personalWords.values)[indexFalse3]
            
            questionButton.setTitle(trueQuestion, for: .normal)
            
            buttons.shuffle()
            buttons[0].setTitle(trueAnswer, for: .normal)
            buttons[1].setTitle(wrongAnswer1, for: .normal)
            buttons[2].setTitle(wrongAnswer2, for: .normal)
            buttons[3].setTitle(wrongAnswer3, for: .normal)
        }
        else{
            aBtn.isHidden = true
            bBtn.isHidden = true
            cBtn.isHidden = true
            dBtn.isHidden = true
            questionButton.setTitle("Lütfen Kelime Öğrenin!", for: .normal)
        }
        
    }
    
    
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    @IBAction func aFunc(_ sender: Any) {
    }
    @IBAction func bFunc(_ sender: Any) {
    }
    @IBAction func cFunc(_ sender: Any) {
    }
    @IBAction func dFunc(_ sender: Any) {
    }
}
