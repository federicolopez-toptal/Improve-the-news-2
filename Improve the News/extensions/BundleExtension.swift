//
//  BundleExtension.swift
//  Improve the News
//
//  Created by Federico Lopez on 04/11/2021.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
