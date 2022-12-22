//
//  DictionaryToDataTransformer.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup on 4.12.2022.
//

import UIKit

class DictionaryToDataTransformer: NSSecureUnarchiveFromDataTransformer {
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            fatalError("Wrong data type: value must be a Data object; received \(type(of: value))")
        }
        return super.transformedValue(data)
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let dictionary = value as? Dictionary<String, String> else {
            fatalError("Wrong data type: value must be a UIColor object; received \(type(of: value))")
        }
        return super.reverseTransformedValue(dictionary)
    }
}

extension NSValueTransformerName {
    static let dictionaryToDataTransformer = NSValueTransformerName(rawValue: "DictionaryToDataTransformer")
}
