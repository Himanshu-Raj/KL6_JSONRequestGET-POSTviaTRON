//
//  User.swift
//  TRONJsonParsingGET-POST
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct User: JSONDecodable {
    
    let name: String
    let companyName: String
    
    init(json: JSON) {
        name = json["name"].stringValue
        companyName = json["company"]["name"].stringValue
        
    }
    
}
