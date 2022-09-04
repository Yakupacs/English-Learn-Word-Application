//
//  ViewControllerLearn.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

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
        "About" : "Hakkında, Aşağı Yukarı, Yaklaşık",
        "Baby" : "Bebek, Yavru",
        "Cafe" : "Kafe, Bar",
        "Dad" : "Baba",
        "Each" : "Her biri",
        "Face" : "Yüz, Yüzleşmek",
        "Game" : "Oyun",
        "Hair" : "Saç"
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
    
    var personalID : UUID?
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalImage : UIImage?
    var personalWords : Dictionary = ["":""]
    var sign : Bool = false
    
    var learnEasyCount : Int = 0
    var learnMiddleCount : Int = 0
    var learnHardCount : Int = 0
    var learnSentenceCount : Int = 0
    
    var learnEasyArray : [String] = [""]
    var learnMiddleArray : [String] = [""]
    var learnHardArray : [String] = [""]
    var learnSentenceArray : [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalWords.removeAll()
        
        pageView.layer.cornerRadius = 30
        userImage.layer.cornerRadius = 30
        yesButton.layer.cornerRadius = 32
        noButton.layer.cornerRadius = 32
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
        let englishWord = easyWord.randomElement()
        if let englishWordLet = englishWord{
            englishLbl.text = englishWordLet.key
            turkishLbl.text = englishWordLet.value
        }
        pageView.backgroundColor = .systemGreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! ViewControllerTabBar
        userUsername.text = tabbar.sendUsername
        userImage.image = tabbar.sendImage
        personalID = tabbar.sendID
        personalImage = tabbar.sendImage
        personalName = tabbar.sendName
        personalSurname = tabbar.sendSurname
        personalUsername = tabbar.sendUsername
        personalPassword = tabbar.sendPassword
        personalWords = tabbar.sendWords
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        wordsRandom()
    }
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    
    @IBAction func noFunc(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnMiddleCount != easyWord.count{
                wordsRandom()
            }
        case 1:
            if learnMiddleCount != middleWord.count{
                wordsRandom()
            }
        case 2:
            if learnHardCount != hardWord.count{
                wordsRandom()
            }
        case 3:
            if learnSentenceCount != sentence.count{
                wordsRandom()
            }
        default:
            break
        }
    }
    @IBAction func yesFunc(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnEasyArray.count != easyWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            if learnMiddleCount != middleWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnMiddleCount += 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 2:
            if learnHardCount != hardWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnHardCount += 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            if learnSentenceCount != sentence.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnSentenceCount = learnEasyArray.count
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }

        print(personalWords)
    }
    
    func wordsRandom(){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            print(easyWord.count,learnEasyArray.count)
            pageView.backgroundColor = .systemGreen
            if easyWord.count != learnEasyArray.count - 1{
                var randomEnglishWord = easyWord.randomElement()
                for (english, _) in personalWords{
                    if let englishWordLet = randomEnglishWord{
                        if english == englishWordLet.key{
                            break
                        }
                        else if english != englishWordLet.key{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                            learnEasyArray.append(englishWordLet.key)
                            break
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemGreen
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            if learnMiddleCount != middleWord.count{
                pageView.backgroundColor = .systemOrange
                var randomEnglishWord = middleWord.randomElement()
                for (english, _) in personalWords{
                    if english == randomEnglishWord?.key{
                        randomEnglishWord = middleWord.randomElement()
                    }
                    else{
                        if let englishWordLet = randomEnglishWord{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemOrange
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }

        case 2:
            if learnHardCount != hardWord.count{
            pageView.backgroundColor = .systemRed
            var randomEnglishWord = hardWord.randomElement()
            for (english, _) in personalWords{
                if english == randomEnglishWord?.key{
                    randomEnglishWord = hardWord.randomElement()
                }
                else{
                    if let englishWordLet = randomEnglishWord{
                        englishLbl.text = englishWordLet.key
                        turkishLbl.text = englishWordLet.value
                    }
                }
            }
            }
            else{
                pageView.backgroundColor = .systemRed
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            if learnSentenceCount != sentence.count{
            pageView.backgroundColor = .systemBlue
            var randomEnglishWord = sentence.randomElement()
            for (english, _) in personalWords{
                if english == randomEnglishWord?.key{
                    randomEnglishWord = sentence.randomElement()
                }
                else{
                    if let englishWordLet = randomEnglishWord{
                        englishLbl.text = englishWordLet.key
                        turkishLbl.text = englishWordLet.value
                    }
                }
            }
            }
            else{
                pageView.backgroundColor = .systemBlue
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }
    }
    
}
