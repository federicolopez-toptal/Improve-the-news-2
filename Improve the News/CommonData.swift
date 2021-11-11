//
//  CommonData.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation

class CommonData {

    static var shared = CommonData()
    var currentUniqueId = 0
    
    var displayMode: DisplayMode?
    var selectedLayout: LayoutType?


    func start() {
        self.displayMode = .dark           //!!!
        self.selectedLayout = .denseIntense     //!!!
    }
}
