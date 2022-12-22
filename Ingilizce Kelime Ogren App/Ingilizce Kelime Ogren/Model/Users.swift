//
//  Users.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/29/22.
//

import Foundation
import UIKit

class Users{
    var id : UUID?
    var words = [String?: String?]()
    var questionCount : Int?
    var trueCount : Int?
    var falseCount : Int?
    var totalRepeat : Int?
    
    init(id : UUID, words : [String : String], questionCount : Int, trueCount : Int, falseCount : Int, totalRepeat: Int) {
        self.id = id
        self.words = words
        self.questionCount = questionCount
        self.trueCount = trueCount
        self.falseCount = falseCount
        self.totalRepeat = totalRepeat
    }
}
