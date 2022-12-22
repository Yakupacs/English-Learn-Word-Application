//
//  ViewControllerTest.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit

class ViewControllerTest: UIViewController {

    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var aBtn: UIButton!
    @IBOutlet weak var bBtn: UIButton!
    @IBOutlet weak var cBtn: UIButton!
    @IBOutlet weak var dBtn: UIButton!
    @IBOutlet weak var page: UIView!
    
    var personalWords = [String: String]()
    
    var trueQuestion : String = ""
    var trueAnswer : String = ""
    var wrongAnswer1 : String = ""
    var wrongAnswer2 : String = ""
    var wrongAnswer3 : String = ""
    
    var trueButton = UIButton()
    var clickButton = UIButton()
    
    var allWords = [String: String]()
    
    var buttons : [UIButton] = []
    
    var timer = Timer()
    var myTime = 0
    
    var ogrenilenKelimeler = 0
    var cozulenSorular = 0
    var dogruSayilari = 0
    var yanlisSayilari = 0
    
    var user : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aBtn.layer.cornerRadius = 20
        bBtn.layer.cornerRadius = 20
        cBtn.layer.cornerRadius = 20
        dBtn.layer.cornerRadius = 20
        
        aBtn.titleLabel?.textAlignment = .center
        bBtn.titleLabel?.textAlignment = .center
        cBtn.titleLabel?.textAlignment = .center
        dBtn.titleLabel?.textAlignment = .center
        
        questionButton.titleLabel?.textAlignment = .center
        questionButton.layer.cornerRadius = 15
        questionButton.titleLabel?.numberOfLines = 0
        page.layer.cornerRadius = 20
        
        buttons = [aBtn, bBtn, cBtn, dBtn]

        getTabBarData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer.invalidate()
        
        questionCount.text = "Çözülen Soru:\(user!.questionCount!)"
        
        aBtn.isHidden = false
        bBtn.isHidden = false
        cBtn.isHidden = false
        dBtn.isHidden = false
        
        aBtn.isEnabled = true
        bBtn.isEnabled = true
        cBtn.isEnabled = true
        dBtn.isEnabled = true
        
        getTabBarData()
        
        if personalWords.count != 1{
            personalWords.removeValue(forKey: "")
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
            
            trueButton = buttons[0]
        }
        else{
            aBtn.isHidden = true
            bBtn.isHidden = true
            cBtn.isHidden = true
            dBtn.isHidden = true
            questionButton.setTitle("Lütfen Kelime Öğrenin!", for: .normal)
        }
    }
    
    @IBAction func aFunc(_ sender: Any) {
        if (myTime == 0){
            myTime = 1
            clickButton = aBtn
            pressButton()
        }
    }
    
    @IBAction func bFunc(_ sender: Any) {
        if (myTime == 0){
            myTime = 1
            clickButton = bBtn
            pressButton()
        }
    }
    
    @IBAction func cFunc(_ sender: Any) {
        if (myTime == 0){
            myTime = 1
            clickButton = cBtn
            pressButton()
        }
    }
    
    @IBAction func dFunc(_ sender: Any) {
        if (myTime == 0){
            myTime = 1
            clickButton = dBtn
            pressButton()
        }
    }
    
    func pressButton(){
        cozulenSorular += 1
        myTime = 2
        if (trueButton == clickButton){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trueFunc), userInfo: nil, repeats: true)
            dogruSayilari += 1
        }
        else{
            yanlisSayilari += 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(falseFunc), userInfo: nil, repeats: true)
        }
        setTabBarData()
    }
    
    @objc func trueFunc(){
        myTime -= 1
        trueButton.layer.borderWidth = 5
        trueButton.layer.borderColor = UIColor.green.cgColor
        if myTime == 0{
            timer.invalidate()
            makeQuestion()
            clearButton()
        }
    }
    
    @objc func falseFunc(){
        myTime -= 1
        clickButton.layer.borderWidth = 5
        clickButton.layer.borderColor = UIColor.red.cgColor
        trueButton.layer.borderWidth = 5
        trueButton.layer.borderColor = UIColor.green.cgColor
        if myTime == 0{
            timer.invalidate()
            makeQuestion()
            clearButton()
        }
    }
    
    func makeQuestion(){
        questionCount.text = "Çözülen Soru:\(user!.questionCount!)"
        if personalWords.count != 1{
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
            
            trueButton = buttons[0]
        }
        else{
            aBtn.isHidden = true
            bBtn.isHidden = true
            cBtn.isHidden = true
            dBtn.isHidden = true
            questionButton.setTitle("Lütfen Kelime Öğrenin!", for: .normal)
        }
    }
    
    func getTabBarData(){
        let tabbar = tabBarController as! TabbarController
        
        personalWords = tabbar.user.words as! [String: String]
        allWords = getAllWords()
        user = tabbar.user
    }
    
    func setTabBarData(){
        let tabbar = tabBarController as! TabbarController
        
        tabbar.user.trueCount = dogruSayilari
        tabbar.user.falseCount = yanlisSayilari
        tabbar.user.questionCount = cozulenSorular
    }
    
    func animateAnswers(){
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
    }
    
    func clearButton()
    {
        aBtn.layer.borderWidth = 0
        aBtn.layer.borderColor = UIColor.clear.cgColor
        bBtn.layer.borderWidth = 0
        bBtn.layer.borderColor = UIColor.clear.cgColor
        cBtn.layer.borderWidth = 0
        cBtn.layer.borderColor = UIColor.clear.cgColor
        dBtn.layer.borderWidth = 0
        dBtn.layer.borderColor = UIColor.clear.cgColor
    }
}
