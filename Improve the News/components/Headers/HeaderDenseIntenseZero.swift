//
//  HeaderDenseIntenseZero.swift
//  Improve the News
//
//  Created by Federico Lopez on 08/11/2021.
//

import UIKit

class HeaderDenseIntenseZero: UITableViewCell {

    @IBOutlet weak var topicNameButton: UIButton!
    
    
    // MARK: - UI update
    private func updateUI() {
        self.selectionStyle = .none
        self.backgroundColor = BG_COLOR()
        
        self.topicNameButton.setTitleColor(headers_mainTextColor, for: .normal)
        self.topicNameButton.titleLabel?.font = UIFont(name: "PTSerif-Bold", size: 40)
        self.topicNameButton.titleLabel?.minimumScaleFactor = 0.5
        self.topicNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func update(topicName: String) {
        self.updateUI()
        self.topicNameButton.setTitle(topicName, for: .normal)
    }
    
}
