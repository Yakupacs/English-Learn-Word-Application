//
//  AttributedTransformer.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup on 4.12.2022.
//

import Foundation
import UIKit

class AttributedStringtoData: ValueTransformer{
    
    override func transformedValue(_ value: Any?) -> Any? {
        let boxedData = try!
        NSKeyedArchiver.archivedData(withRootObject: value!, requiringSecureCoding: true)
        return boxedData
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        let typedBlob = value as! Data
        let data = try!
        NSKeyedUnarchiver.unarchivedObject(ofClass: [NSAttributedString.self], from: typedBlob)
        return (data as! NSAttributedString)
    }
}
