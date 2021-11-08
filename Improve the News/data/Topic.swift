//
//  Topic.swift
//  Improve the News
//
//  Created by Federico Lopez on 05/11/2021.
//

import Foundation
import UIKit
import SwiftyJSON



// ----------------------------------
struct Hierarchy {
    var topicCode: String
    var topicNameToDisplay: String
    
    init(json: JSON) {
        self.topicCode = json[0].stringValue            // news, world, politics...
        self.topicNameToDisplay = json[1].stringValue   // Headlines, World, Politics...
    }
}

// ----------------------------------
struct Topic {

    var code: String
    var sliderCode: String
    var nameToDisplay: String
    var description: String
    var hierarchy: [Hierarchy]
    var articles: [Article]
    
    var subTopicsCount: Int
    var popularity: CGFloat
    var chosenPopularity: CGFloat
    var globalPopularity: CGFloat


    init(json: JSON) {
        let infoJson = json[0]
        let articlesJson = json[1]
    
        self.code  = infoJson[0].stringValue            // news, world, politics...
        self.sliderCode = infoJson[4].stringValue       // aa, Aa, xh...
        self.nameToDisplay = infoJson[2].stringValue    // Headlines, World, Politics...
        self.description = infoJson[1].stringValue      // headline, world, politics...
        
        self.subTopicsCount = infoJson[3].intValue
        self.popularity = CGFloat(infoJson[5].floatValue)
        self.chosenPopularity = CGFloat(infoJson[6].floatValue)
        self.globalPopularity = CGFloat(infoJson[7].floatValue)
        
        self.hierarchy = [Hierarchy]()
        let _hierarchy = infoJson[8].arrayValue
        if(_hierarchy.count>0) {
            for _topic in _hierarchy {
                self.hierarchy.append(Hierarchy(json: _topic))
            }
        }
        
        self.articles = [Article]()
        for (i, artJson) in articlesJson {
            let article = Article(json: artJson)
            self.articles.append(article)
        }
    }
}
