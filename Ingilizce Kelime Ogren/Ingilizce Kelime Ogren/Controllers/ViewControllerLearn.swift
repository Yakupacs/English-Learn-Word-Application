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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userUsername: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var turkishLbl: UILabel!
    
    var easyWord = [
        "About" : "Aşağı Yukarı, Yaklaşık",
        "Action" : "Davranış",
        "Above" : "Üzerine, Yukarısında",
        "Across" : "Karşıya",
        "Activity" : "Etkinlik, Faaliyet",
        "Actor" : "Oyuncu"
    ]
    
    var middleWord = [
        "Absolutely" : "Kesinlikle, Mutlaka",
        "Academic" : "Akademik, Üniversite Öğretim Görevlisi",
        "Access" : "Erişim",
        "Accommodation" : "Konaklama",
        "Account" : "Hesap",
        "Achievement" : "Başarı"
    ]
    
    var hardWord = [
        "Abolish" : "Feshetmek",
        "Abortion" : "Bebek Aldırma, Kürtaj",
        "Absence" : "Bulunmayış",
        "Absent" : "Hazır Bulunmayan",
        "Absurd" : "Absürt, Saçma",
        "Abundance" : "Çokluk, Bereket",
        "Abuse" : "Suistimal Etmek, Kötüye Kullanmak",
        "Academy" : "Akademi, Yüksekokul",
        "Accelerate" : "Hızlanmak",
        "Acceptance" : "Kabul, Alma",
        "Accessible" : "Ulaşılabilir",
        "Accomplishment" : "Başarma, Becerme",
        "Accordance" : "Uygunluk",
        "Accordingly" : "Dolayısıyla"
    ]
    
    var sentence = [
        "What's up?" : "Naber?",
        "So so" : "İdare Eder",
        "How is it going?" : "Nasıl Gidiyor?",
        "Let's go" : "Haydi Gidelim!",
        "Let's go on" : "Devam Edelim!",
        "Give me a hand!" : "Yardım et, bir el at!",
        "I will see to it!" : "İlgileneceğim, bakacağım",
        "Get out of here" : "Defol buradan!",
        "My head is killing me!" : "Başım beni öldürüyor!",
        "What a beatiful girl!" : "Ne güzel bir kız!",
        "I am broke!" : "Parasızım",
        "I am hungry!" : "Açım!",
        "I am starving!" : "Açlıktan Ölüyorum",
        "Don't get me wrong!" : "Beni yanlış anlama!",
        "It sounds good!" : "Kulağa Hoş Geliyor!",
        "It is beyond me!" : "Bu beni aşar!",
        "It is up to you!" : "Sana bağlı, sen bilirsin.",
        "You can trust me!" : "Bana güvenebilirsin!",
        "Let's get to the point!" : "Sadede gelelim!",
        "Guess what!" : "Bil bakalım!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.layer.cornerRadius = 30
        userImage.layer.cornerRadius = 30
        yesButton.layer.cornerRadius = 32
        noButton.layer.cornerRadius = 32
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
        let englishWord = easyWord.randomElement()?.key
        let turkishWord = easyWord.randomElement()?.value
        if let englishWordLet = englishWord{
            if let turkishWordLet = turkishWord{
                englishLbl.text = englishWordLet
                turkishLbl.text = turkishWordLet
            }
        }
        pageView.backgroundColor = .systemBlue
        yesButton.backgroundColor = .systemBlue
        noButton.backgroundColor = .systemBlue
        segmentedControl.selectedSegmentTintColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! ViewControllerTabBar
        userUsername.text = tabbar.sendUsername
        userImage.image = tabbar.sendImage
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            pageView.backgroundColor = .systemBlue
            yesButton.backgroundColor = .systemBlue
            noButton.backgroundColor = .systemBlue
            segmentedControl.selectedSegmentTintColor = .systemBlue
            let englishWord = easyWord.randomElement()?.key
            let turkishWord = easyWord.randomElement()?.value
            if let englishWordLet = englishWord{
                if let turkishWordLet = turkishWord{
                    englishLbl.text = englishWordLet
                    turkishLbl.text = turkishWordLet
                }
            }
        case 1:
            pageView.backgroundColor = .systemPink
            yesButton.backgroundColor = .systemPink
            noButton.backgroundColor = .systemPink
            segmentedControl.selectedSegmentTintColor = .systemPink
            let englishWord = middleWord.randomElement()?.key
            let turkishWord = middleWord.randomElement()?.value
            if let englishWordLet = englishWord{
                if let turkishWordLet = turkishWord{
                    englishLbl.text = englishWordLet
                    turkishLbl.text = turkishWordLet
                }
            }
        case 2:
            pageView.backgroundColor = .systemRed
            yesButton.backgroundColor = .systemRed
            noButton.backgroundColor = .systemRed
            segmentedControl.selectedSegmentTintColor = .systemRed
            let englishWord = hardWord.randomElement()?.key
            let turkishWord = hardWord.randomElement()?.value
            if let englishWordLet = englishWord{
                if let turkishWordLet = turkishWord{
                    englishLbl.text = englishWordLet
                    turkishLbl.text = turkishWordLet
                }
            }
        case 3:
            pageView.backgroundColor = .systemGreen
            yesButton.backgroundColor = .systemGreen
            noButton.backgroundColor = .systemGreen
            segmentedControl.selectedSegmentTintColor = .systemGreen
            let englishWord = sentence.randomElement()?.key
            let turkishWord = sentence.randomElement()?.value
            if let englishWordLet = englishWord{
                if let turkishWordLet = turkishWord{
                    englishLbl.text = englishWordLet
                    turkishLbl.text = turkishWordLet
                }
            }
        default:
            break
        }
    }
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    

}
