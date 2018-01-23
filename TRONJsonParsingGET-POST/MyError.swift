//
//  MyError.swift
//  TRONJsonParsingGET-POST
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct MyError: JSONDecodable {
    
    let isEmpty: Bool
    
    init(json: JSON) throws {
        print("JSON: \(json)")
        print("JSON parsing error")
        isEmpty = json.isEmpty
    }
    
}
