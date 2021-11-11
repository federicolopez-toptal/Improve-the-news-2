//
//  UI_Customization.swift
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

let headers_mainTextColor = UIColor(rgb: 0xD3592D)
let placeHolders_bgColor_dark = UIColor(rgb: 0x334262).withAlphaComponent(0.5)
let placeHolders_bgColor_bright = UIColor.black.withAlphaComponent(0.15)

let articles_titleTextColor_dark = UIColor(rgb: 0xE4E5DF)
let articles_titleTextColor_bright = UIColor(rgb: 0x222B51)
let articles_sourceTextColor_dark = UIColor(rgb: 0x334262)
let articles_sourceTextColor_bright = UIColor.black.withAlphaComponent(0.3)





let stanceMiniSliders_lineColor_dark = UIColor(rgb: 0x4F5F8B)
let stanceMiniSliders_lineColor_bright = UIColor(rgb: 0xD3592D)
let stanceMiniSliders_thumbColor_dark = UIColor(rgb: 0xDFE1D8)
let stanceMiniSliders_thumbColor_bright = UIColor(rgb: 0xD3592D)
let footer_moreTextColor_dark = UIColor(rgb: 0x334262)
let footer_moreTextColor_bright = UIColor.black.withAlphaComponent(0.3)
let footer_topicTextColor = UIColor(rgb: 0xD3592D)
let footer_sepLineColor_dark = UIColor(rgb: 0x334262)
let footer_sepLineColor_bright = UIColor.black.withAlphaComponent(0.3)
let footerAbout_textsColor_dark = UIColor(rgb: 0x737D96)
let footerAbout_textsColor_bright = UIColor.black

let articleTextOnly_separatorColor_dark = UIColor.white.withAlphaComponent(0.05)
let articleTextOnly_separatorColor_bright = UIColor.black.withAlphaComponent(0.05)

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

func BG_COLOR() -> UIColor {
    return COLOR(viewController_bgColor_dark, viewController_bgColor_bright)
}

func GET_FLAG(id: String) -> UIImage {
    var result = UIImage(named: "\(id.uppercased())64.png")
    if(result==nil) {
        result = UIImage(named: "noFlag.png")
    }
    return result!
}
