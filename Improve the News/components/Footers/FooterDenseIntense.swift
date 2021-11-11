//
//  FooterDenseIntense.swift
//  Improve the News
//
//  Created by Federico Lopez on 11/11/2021.
//

import UIKit

class FooterDenseIntense: UITableViewCell {

    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var topicButton: UIButton!
    @IBOutlet weak var topLine: UIView!
    

    private func updateUI() {
        self.backgroundColor = BG_COLOR()
            
        let stackView = self.contentView.subviews.first as! UIStackView
        stackView.backgroundColor = self.backgroundColor
        
        moreLabel.textColor = COLOR(footer_moreTextColor_dark,
            footer_moreTextColor_bright)
        self.topicButton.titleLabel?.font = moreLabel.font
        self.topicButton.setTitleColor(footer_topicTextColor, for: .normal)
        
        self.topLine.backgroundColor = COLOR(footer_sepLineColor_dark,
            footer_sepLineColor_bright)
            
        self.selectionStyle = .none
    }
    
    func update(topicName: String, separator: Bool) {
        self.updateUI()
        self.topicButton.setTitle(topicName, for: .normal)
        self.topLine.isHidden = !separator
    }
    
}
