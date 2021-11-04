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

func SAFE_AREA() -> UIEdgeInsets {
    let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    return window!.safeAreaInsets
}

func NEWS_VC() -> NewsViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "idNews") as! NewsViewController
}

func DEVICE_NAME() -> String {
    return UIDevice.current.modelName.replacingOccurrences(of: " ", with: "_")
}
