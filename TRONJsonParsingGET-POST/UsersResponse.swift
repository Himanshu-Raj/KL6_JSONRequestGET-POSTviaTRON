//
//  UsersResponse.swift
//  TRONJsonParsingGET-POST
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct UsersResponse: JSONDecodable {
    
    let users: [User]
    
    init(json: JSON) throws {
        print("JSON from UsersResponse: \(json)")
        let usersArray = json.arrayValue
        users = usersArray.map({ User(json: $0) })
    }
}
