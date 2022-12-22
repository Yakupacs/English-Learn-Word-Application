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
    @IBOutlet weak var turkishLbl: UILabel!
    @IBOutlet weak var bodyPage: UIView!
    
    var learnedEasyCount : Int = 0
    var learnedMiddleCount : Int = 0
    var learnedHardCount : Int = 0
    var learnedSentenceCount : Int = 0
    
    var learnedEasy = [String: String]()
    var learnedMiddle = [String: String]()
    var learnedHard = [String: String]()
    var learnedSentence = [String: String]()
    
    var allWords = [String: String]()
    var personalWords = [String: String]()
    
    var easyWord = [String: String]()
    var middleWord = [String: String]()
    var hardWord = [String: String]()
    var sentence = [String: String]()
    
    var user : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.layer.cornerRadius = 60
        bodyPage.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 40
        noButton.layer.cornerRadius = 40
        segmentedControl.selectedSegmentTintColor = UIColor.white

        let tabbar = tabBarController as! TabbarController
        user = tabbar.user
        personalWords = tabbar.user.words as! [String:String]
        personalWords.removeValue(forKey: "")
        
        allWords = getAllWords()
        easyWord = getEasyWords()
        middleWord = getMiddleWords()
        hardWord = getHardWords()
        sentence = getSentenceWords()
        
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var i = 0
        var englishWord = easyWord.randomElement()
        while personalWords.keys.contains(englishWord!.key) && i != easyWord.count{
            englishWord = easyWord.randomElement()
            i += 1
        }
        if (i == easyWord.count){
            englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
            turkishLbl.text = ""
        }
        else{
            englishLbl.text = englishWord!.key
            turkishLbl.text = englishWord!.value
        }
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        wordsRandom()
    }
    
    @IBAction func noFunc(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnedMiddleCount != easyWord.count{
                wordsRandom()
            }
        case 1:
            if learnedMiddleCount != middleWord.count{
                wordsRandom()
            }
        case 2:
            if learnedHardCount != hardWord.count{
                wordsRandom()
            }
        case 3:
            if learnedSentenceCount != sentence.count{
                wordsRandom()
            }
        default:
            break
        }
    }
    @IBAction func yesFunc(_ sender: Any) {
        learnedEasyCount = learnedEasy.count - 1
        learnedMiddleCount = learnedMiddle.count - 1
        learnedHardCount = learnedHard.count - 1
        learnedSentenceCount = learnedSentence.count - 1
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnedEasyCount != easyWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                user?.words = (user?.words.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first}))!
                learnedEasy = learnedEasy.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnedEasyCount = learnedEasy.count - 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            if learnedMiddleCount != middleWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                user?.words = (user?.words.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first}))!
                learnedMiddle = learnedMiddle.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnedMiddleCount = learnedMiddle.count - 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 2:
            if learnedHardCount != hardWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                user?.words = (user?.words.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first}))!
                learnedHard = learnedHard.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnedHardCount = learnedHard.count - 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            if learnedSentenceCount != sentence.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                user?.words = (user?.words.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first}))!
                learnedSentence = learnedSentence.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnedSentenceCount = learnedSentence.count - 1
                wordsRandom()
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }
    }
    
    func wordsRandom(){
        learnedEasyCount = learnedEasy.count
        learnedMiddleCount = learnedMiddle.count
        learnedHardCount = learnedHard.count
        learnedSentenceCount = learnedSentence.count
        
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if easyWord.count != learnedEasyCount{
                controlWord(word: easyWord)
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            if middleWord.count != learnedMiddleCount{
                controlWord(word: middleWord)
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }

        case 2:
            if hardWord.count != learnedHardCount{
                controlWord(word: hardWord)
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            if sentence.count != learnedSentenceCount{
                controlWord(word: sentence)
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }
    }
    
    func controlWord(word : [String : String]){
        let randomEnglishWord = word.randomElement()
        for (english, _) in user?.words as! [String : String]{
            if let englishWordLet = randomEnglishWord{
                if english == englishWordLet.key{
                    break
                }
                else if english != englishWordLet.key{
                    englishLbl.text = englishWordLet.key
                    turkishLbl.text = englishWordLet.value
                    break
                }
            }
        }
    }
    


}
