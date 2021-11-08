//
//  Article.swift
//  Improve the News
//
//  Created by Federico Lopez on 05/11/2021.
//

import Foundation
import SwiftyJSON

struct Article {

    var title: String
    var imageUrl: String
    var LR: Int
    var PE: Int
    var flag: String
    var source: String
    var time: String
    var markups: [Markup]

    private var AMP_status: String  // E: yes, N: None, P: Phone only
    private var AMP_url: String
    private var url: String

    init(json: JSON) {
        self.title = json[2].stringValue
        self.imageUrl = json[4].stringValue
        self.LR = json[8].intValue
        self.PE = json[9].intValue
        self.flag = json[10].stringValue
        self.source = json[0].stringValue
        self.time = json[1].stringValue
        
        self.AMP_status = json[5].stringValue
        self.AMP_url = json[6].stringValue
        self.url = json[3].stringValue
        
        let markupsJson = json[7]
        self.markups = [Markup]()
        for (_, mkJson) in markupsJson {
            let markup = Markup(json: mkJson)
            self.markups.append(markup)
        }
    }
    
    func getUrl() -> String {
        if(self.AMP_status.uppercased() != "N") {
            if(VALIDATE_URL(self.AMP_url)) {
                return self.AMP_url
            }
        }
        
        if(!VALIDATE_URL(self.url)) {
            LOG_ERROR(path: "Article/getUrl", description: "Invalid main URL")
        }
        
        return self.url
    }
    
}
