//
//  Utils.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation
import UIKit


func SLEEP(time: TimeInterval) {
    Thread.sleep(forTimeInterval: time)
}

func DELAY(_ time: TimeInterval, callback: @escaping () ->() ) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
        callback()
    })
}

func FRAME(width W: CGFloat, height H: CGFloat) -> CGRect {
    return CGRect(x: 0, y: 0, width: W, height: H)
}
