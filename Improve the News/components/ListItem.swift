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
    case headerDenseIntenseZero = 51.1
    case headerDenseIntense = 51.2
    
    case articleDenseIntense = 10.0
    case footerDenseIntense = 20.0
}

struct ListItem {
    var type: ListItemType
    var topicIndex: Int
    var articleIndex: Int?
}
