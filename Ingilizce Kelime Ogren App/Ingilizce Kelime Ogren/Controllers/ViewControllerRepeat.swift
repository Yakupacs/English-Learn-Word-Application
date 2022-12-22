//
//  ViewControllerRepeat.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

class ViewControllerRepeat: UIViewController {
    
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var englishLbl: UILabel!
    @IBOutlet weak var turkishLbl: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var page: UIView!
    @IBOutlet weak var totalRepeatLabel: UILabel!
    
    var user : Users?
    var i = 0
    var transferWords = [String: String]()
    var totalRepeat : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageView.backgroundColor = UIColorFromRGB(rgbValue: 0x2E225B)
        repeatButton.backgroundColor = UIColorFromRGB(rgbValue: 0x42406F)
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
        pageView.layer.cornerRadius = 60
        page.layer.cornerRadius = 20
        repeatButton.layer.cornerRadius = 35
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transferWords.removeAll()
        
        let tabbar = tabBarController as! TabbarController
        user = tabbar.user
        transferWords = user?.words as! [String: String]

        transferWords.removeValue(forKey: "")
        
        if (tabbar.user.words.count == 1){
            englishLbl.text = "Henüz Kelime Öğrenmedin"
            turkishLbl.text = ""
        }
        else
        {
            wordsList()
        }
    }
    
    func wordsList(){
        if transferWords.count == 0{
            englishLbl.text = "Tebrikler, Kelimeler Bitti"
            turkishLbl.text = ""
        }
        else{
            for (english, turkish) in transferWords{
                turkishLbl.text = turkish
                englishLbl.text = english
                transferWords.removeValue(forKey: english)
                break
            }
        }
    }
    
    @IBAction func shuffleFunc(_ sender: Any) {
        if (user?.words.count == 1){
            englishLbl.text = "Henüz Kelime Öğrenmedin"
        }
        else{
            if englishLbl.text != "Tebrikler, Kelimeler Bitti"{
                self.wordsList()
                
                let tabbar = tabBarController as! TabbarController
                tabbar.user.totalRepeat! += 1
                totalRepeatLabel.text = "Toplam Tekrar Edilen Kelime:\(tabbar.user.totalRepeat!)"
            }
        }
    }
}
