//
//  CommonData.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation

class CommonData {

    static var shared = CommonData()
    
    var displayMode: DisplayMode?
    var currentUniqueId = 0

    func start() {
        self.displayMode = .dark    //!!!
    }
}
