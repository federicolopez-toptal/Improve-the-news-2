//
//  Markup.swift
//  Improve the News
//
//  Created by Federico Lopez on 08/11/2021.
//

import Foundation
import SwiftyJSON


class Markup {

    var text: String
    var type: String
    var url: String

    init(json: JSON) {
        self.text = json[0].stringValue
        self.type = json[1].stringValue
        self.url  = json[2].stringValue
    }

}
