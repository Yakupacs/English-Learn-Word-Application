//
//  ViewControllerUserDetails.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 9/1/22.
//

import UIKit

class ViewControllerStatics: UIViewController{

    @IBOutlet weak var learnWordCount: UILabel!
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var trueCount: UILabel!
    @IBOutlet weak var falseCount: UILabel!
    @IBOutlet weak var totalRepeatCount: UILabel!
    
    var user : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! TabbarController
        
        learnWordCount.text = "Öğrenilen Kelime Sayısı: \(tabbar.user.words.count - 1)"
        questionCount.text = "Çözülen Soru Sayısı: \(tabbar.user.questionCount!)"
        trueCount.text = "Çözülen Doğru Soru Sayısı: \(tabbar.user.trueCount!)"
        falseCount.text = "Çözülen Doğru Yanlış Sayısı: \(tabbar.user.falseCount!)"
        user = tabbar.user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! TabbarController
    
        learnWordCount.text = "Öğrenilen Kelime Sayısı: \(tabbar.user.words.count - 1)"
        questionCount.text = "Çözülen Soru Sayısı: \(tabbar.user.questionCount!)"
        trueCount.text = "Çözülen Doğru Soru Sayısı: \(tabbar.user.trueCount!)"
        falseCount.text = "Çözülen Yanlış Soru Sayısı: \(tabbar.user.falseCount!)"
        totalRepeatCount.text = "Toplam Tekrar Edilen Kelime: \(tabbar.user.totalRepeat!)"
    }
    

    

}
