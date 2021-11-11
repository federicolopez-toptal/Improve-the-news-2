//
//  ArticleDenseIntense.swift
//  Improve the News
//
//  Created by Federico Lopez on 10/11/2021.
//

import UIKit
import SDWebImage


class ArticleDenseIntense: UITableViewCell {
    
    @IBOutlet weak var thumb1: UIImageView!
    @IBOutlet weak var thumb2: UIImageView!
    @IBOutlet weak var thumb1_heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumb2_heightConstraint: NSLayoutConstraint!

    var stanceMiniSliders1: StanceMiniSliders?
    var stanceMiniSliders2: StanceMiniSliders?
    @IBOutlet weak var stanceMiniSliders1View: UIView!
    @IBOutlet weak var stanceMiniSliders2View: UIView!

    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var title2Label: UILabel!

    @IBOutlet weak var flag1: UIImageView!
    @IBOutlet weak var flag2: UIImageView!
    @IBOutlet weak var source1Label: UILabel!
    @IBOutlet weak var source2Label: UILabel!

    private func updateUI() {
        self.backgroundColor = COLOR(viewController_bgColor_dark,
            viewController_bgColor_bright)
            
        let stackView = self.contentView.subviews.first as! UIStackView
        stackView.backgroundColor = self.backgroundColor
        
        self.thumb1.layer.cornerRadius = 15
        self.thumb1.clipsToBounds = true
        self.flag1.layer.cornerRadius = 10
        self.thumb2.layer.cornerRadius = 15
        self.thumb2.clipsToBounds = true
        self.flag2.layer.cornerRadius = 10
        self.thumb1.contentMode = .scaleAspectFill
        self.thumb2.contentMode = .scaleAspectFill
        self.flag1.backgroundColor = COLOR(article_flagBgColor_dark,
            article_flagBgColor_bright)
        self.flag2.backgroundColor = COLOR(article_flagBgColor_dark,
            article_flagBgColor_bright)
        
        let view1 = stackView.subviews[0]
        view1.backgroundColor = self.backgroundColor
        let view2 = stackView.subviews[1]
        view2.backgroundColor = self.backgroundColor
        self.title1Label.backgroundColor = self.backgroundColor
        self.source1Label.backgroundColor = self.backgroundColor
        self.title2Label.backgroundColor = self.backgroundColor
        self.source2Label.backgroundColor = self.backgroundColor
        
        self.title1Label.textColor = COLOR(article_titleTextColor_dark,
            article_titleTextColor_bright)
        self.title2Label.textColor = title1Label.textColor
        self.source1Label.textColor = COLOR(article_sourceTextColor_dark,
            article_sourceTextColor_bright)
        self.source2Label.textColor = self.source1Label.textColor
        
        self.title1Label.adjustsFontSizeToFitWidth = true
        self.title1Label.minimumScaleFactor = 0.5
        self.title1Label.lineBreakMode = .byClipping
        self.title2Label.adjustsFontSizeToFitWidth = true
        self.title2Label.minimumScaleFactor = 0.5
        self.title2Label.lineBreakMode = .byClipping
        
        if(self.stanceMiniSliders1==nil) {
            self.stanceMiniSliders1 = StanceMiniSliders(into: self.stanceMiniSliders1View)
        }
        
        if(self.stanceMiniSliders2==nil) {
            self.stanceMiniSliders2 = StanceMiniSliders(into: self.stanceMiniSliders2View)
        }
        
        self.selectionStyle = .none
    }
    
    private func getFlag(id: String) -> UIImage {
        var result = UIImage(named: "\(id.uppercased())64.png")
        if(result==nil) {
            result = UIImage(named: "noFlag.png")
        }
        return result!
    }

    func update(article1: Article, article2: Article?) {
        self.updateUI()
        
        self.title1Label.text = article1.title
        self.stanceMiniSliders1?.setValues(val1: article1.LR, val2: article1.PE)
        self.source1Label.text = article1.source + " - " + article1.time

        self.thumb1.sd_setImage(with: URL(string: article1.imageUrl),
            placeholderImage: nil)
        self.flag1.image = self.getFlag(id: article1.flag)
        
        let stackView = self.contentView.subviews.first as! UIStackView
        let view2 = stackView.subviews[1]
        if let art2 = article2 {
            self.title2Label.text = art2.title
            self.stanceMiniSliders2?.setValues(val1: art2.LR, val2: art2.PE)
            self.source2Label.text = art2.source + " - " + art2.time
            
            self.thumb2.sd_setImage(with: URL(string: art2.imageUrl),
                placeholderImage: nil)
            self.flag2.image = self.getFlag(id: art2.flag)
            
            view2.isHidden = false
        } else {
            view2.isHidden = true
        }
    }

}
