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
    @IBOutlet weak var ogrenilenKelimeSayisi: UILabel!
    @IBOutlet weak var cozulenSoruSayisi: UILabel!
    @IBOutlet weak var dogruSayisi: UILabel!
    @IBOutlet weak var yanlisSayisi: UILabel!
    
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
    
    var whichButton : String = ""
    
    var allWords : Dictionary = ["":""]
    
    var buttons : [UIButton] = []
    
    var timer = Timer()
    var myTime = 2
    
    var ogrenilenKelimeler = 0
    var cozulenSorular = 0
    var dogruSayilari = 0
    var yanlisSayilari = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aBtn.titleLabel?.textAlignment = .center
        bBtn.titleLabel?.textAlignment = .center
        cBtn.titleLabel?.textAlignment = .center
        dBtn.titleLabel?.textAlignment = .center
        
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
        allWords = tabbar.allWords
        allWords.removeValue(forKey: "")
        
        ogrenilenKelimeSayisi.text = "Öğrenilen Kelime Sayisi: \(personalWords.keys.count)"
        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer.invalidate()
        
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
        allWords = tabbar.allWords
        personalWords.removeValue(forKey: "")
        allWords.removeValue(forKey: "")

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
            let indexFalse1: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer1 = Array(allWords.values)[indexFalse1]
            let indexFalse2: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer2 = Array(allWords.values)[indexFalse2]
            let indexFalse3: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer3 = Array(allWords.values)[indexFalse3]
            
            questionButton.setTitle(trueQuestion, for: .normal)
            
            buttons.shuffle()
            buttons[0].setTitle(trueAnswer, for: .normal)
            buttons[1].setTitle(wrongAnswer1, for: .normal)
            buttons[2].setTitle(wrongAnswer2, for: .normal)
            buttons[3].setTitle(wrongAnswer3, for: .normal)
            
            if buttons[0] == aBtn{
                whichButton = "a"
            }
            else if buttons[0] == bBtn{
                whichButton = "b"
            }
            else if buttons[0] == cBtn{
                whichButton = "c"
            }
            else if buttons[0] == dBtn{
                whichButton = "d"
            }
        }
        else{
            aBtn.isHidden = true
            bBtn.isHidden = true
            cBtn.isHidden = true
            dBtn.isHidden = true
            questionButton.setTitle("Lütfen Kelime Öğrenin!", for: .normal)
        }
        
        ogrenilenKelimeSayisi.text = "Öğrenilen Kelime Sayısı: \(personalWords.keys.count)"
        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
    }
    
    @IBAction func aFunc(_ sender: Any) {
        cozulenSorular += 1
        myTime = 2
        if (whichButton == "a"){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trueFunc), userInfo: nil, repeats: true)
            dogruSayilari += 1

        }
        else{
            yanlisSayilari += 1
            print("yanlış")
        }

        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
        
    }
    
    @IBAction func bFunc(_ sender: Any) {
        cozulenSorular += 1
        myTime = 2
        if (whichButton == "b"){
            dogruSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trueFunc), userInfo: nil, repeats: true)
        }
        else{
            yanlisSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(falseFunc), userInfo: nil, repeats: true)
        }
        
        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
    }
    
    @IBAction func cFunc(_ sender: Any) {
        cozulenSorular += 1
        myTime = 2
        if (whichButton == "c"){
            dogruSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trueFunc), userInfo: nil, repeats: true)
        }
        else{
            yanlisSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(falseFunc), userInfo: nil, repeats: true)
        }
        
        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
    }
    
    @IBAction func dFunc(_ sender: Any) {
        cozulenSorular += 1
        myTime = 2
        if (whichButton == "d"){
            dogruSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trueFunc), userInfo: nil, repeats: true)
        }
        else{
            yanlisSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(falseFunc), userInfo: nil, repeats: true)
        }
        
        cozulenSoruSayisi.text = "Çözülen Soru Sayısı: \(cozulenSorular)"
        dogruSayisi.text = "Doğru Sayısı: \(dogruSayilari)"
        yanlisSayisi.text = "Yanlış Sayısı: \(yanlisSayilari)"
    }
    
    @objc func trueFunc(){
        myTime -= 1
        
        aBtn.isEnabled = false
        bBtn.isEnabled = false
        cBtn.isEnabled = false
        dBtn.isEnabled = false
        
        if whichButton == "a"{
            aBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "b"{
            bBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "c"{
            cBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "d"{
            dBtn.backgroundColor = UIColor.green
        }
        if myTime == 0{
            timer.invalidate()
            makeQuestion()
            aBtn.isEnabled = true
            bBtn.isEnabled = true
            cBtn.isEnabled = true
            dBtn.isEnabled = true
            
            aBtn.backgroundColor = UIColor.red
            bBtn.backgroundColor = UIColor.red
            cBtn.backgroundColor = UIColor.red
            dBtn.backgroundColor = UIColor.red
        }
    }
    
    @objc func falseFunc(){
        myTime -= 1
        
        aBtn.isEnabled = false
        bBtn.isEnabled = false
        cBtn.isEnabled = false
        dBtn.isEnabled = false
        
        if whichButton == "a"{
            aBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "b"{
            bBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "c"{
            cBtn.backgroundColor = UIColor.green
        }
        else if whichButton == "d"{
            dBtn.backgroundColor = UIColor.green
        }
        if myTime == 0{
            timer.invalidate()
            makeQuestion()
            aBtn.isEnabled = true
            bBtn.isEnabled = true
            cBtn.isEnabled = true
            dBtn.isEnabled = true
            
            aBtn.backgroundColor = UIColor.red
            bBtn.backgroundColor = UIColor.red
            cBtn.backgroundColor = UIColor.red
            dBtn.backgroundColor = UIColor.red
        }
    }
    
    func makeQuestion(){
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
            let indexFalse1: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer1 = Array(allWords.values)[indexFalse1]
            let indexFalse2: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer2 = Array(allWords.values)[indexFalse2]
            let indexFalse3: Int = Int(arc4random_uniform(UInt32(allWords.count)))
            wrongAnswer3 = Array(allWords.values)[indexFalse3]
            
            questionButton.setTitle(trueQuestion, for: .normal)
            
            buttons.shuffle()
            buttons[0].setTitle(trueAnswer, for: .normal)
            buttons[1].setTitle(wrongAnswer1, for: .normal)
            buttons[2].setTitle(wrongAnswer2, for: .normal)
            buttons[3].setTitle(wrongAnswer3, for: .normal)
            
            if buttons[0] == aBtn{
                whichButton = "a"
            }
            else if buttons[0] == bBtn{
                whichButton = "b"
            }
            else if buttons[0] == cBtn{
                whichButton = "c"
            }
            else if buttons[0] == dBtn{
                whichButton = "d"
            }
        }
        else{
            aBtn.isHidden = true
            bBtn.isHidden = true
            cBtn.isHidden = true
            dBtn.isHidden = true
            questionButton.setTitle("Lütfen Kelime Öğrenin!", for: .normal)
        }
    }
}
