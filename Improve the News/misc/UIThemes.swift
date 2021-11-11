//
//  UIThemes.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation
import UIKit


let navBar_bgColor_dark = UIColor(rgb: 0x0B1229)
let navBar_bgColor_bright = UIColor(rgb: 0xE8E5E7)
let viewController_bgColor_dark = UIColor(rgb: 0x131B33)
let viewController_bgColor_bright = UIColor(rgb: 0xFFFFFF)
let header_mainTextColor = UIColor(rgb: 0xD3592D)
let header_hierarchyTextColor = UIColor(rgb: 0x334262)

//------------------------------------------
enum DisplayMode {
    case dark
    case bright
}

enum LayoutType {
    case denseIntense
    case textOnly
    case bigBeautiful
}

//------------------------------------------

func DARK_MODE() -> Bool {
    if(CommonData.shared.displayMode == .dark){ return true }
    return false
}

func BRIGHT_MODE() -> Bool {
    if(CommonData.shared.displayMode == .bright){ return true }
    return false
}

func UPDATE_STATUSBAR_COLOR(navBar: UINavigationBar?) {
    if(CommonData.shared.displayMode == .dark){ navBar?.barStyle = .black }
    else { navBar?.barStyle = .default }
}

func COLOR(_ forDarkMode: UIColor, _ forBrightMode: UIColor) -> UIColor {
    return DARK_MODE() ? forDarkMode : forBrightMode
}
