//
//  ListItem.swift
//  Improve the News
//
//  Created by Federico Lopez on 08/11/2021.
//

import Foundation
import UIKit


enum ListItemType: CGFloat {
    // The raw values represents the component height
    case headerDenseIntenseZero = 60.0
    case headerDenseIntense = 53.0
    
    case articleDenseIntense = 240.0    // 2 columns
    case footerDenseIntense = 70.0
    
    case footerAbout = 200.0
}

struct ListItem {
    var type: ListItemType
    var topicIndex: Int
    var articleIndex: Int?
}
