//
//  Post.swift
//  TRONJsonParsingGET-POST
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Post: JSONDecodable {
    
    let username: String
    let message: String
    
    init(json: JSON) {
        print(json)
        username = json["username"].stringValue
        message = json["message"].stringValue
    }
}
