//
//  FooterAbout.swift
//  Improve the News
//
//  Created by Federico Lopez on 11/11/2021.
//

import UIKit

class FooterAbout: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var shareButton: UIButton!
    
    func updateUI() {
        self.backgroundColor = BG_COLOR()
            
        var logo = UIImage(named: "ITN-logo_whiteText")
        if(BRIGHT_MODE()){ logo = UIImage(named: "ITN-logo_darkText") }
        self.logoImageView.image = logo
        
        for V in self.contentView.subviews {
            if(V is UILabel) {
                let label = V as! UILabel
                label.textColor = COLOR(footerAbout_textsColor_dark,
                    footerAbout_textsColor_bright)
            }
        }
        
        self.shareButton.layer.cornerRadius = 0.5 * 55
        self.selectionStyle = .none
        
        self.topLine.backgroundColor = COLOR(footer_sepLineColor_dark,
            footer_sepLineColor_bright)
    }

}
