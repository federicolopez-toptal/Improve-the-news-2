//
//  ArticleTextOnly.swift
//  Improve the News
//
//  Created by Federico Lopez on 11/11/2021.
//

import UIKit

class ArticleTextOnly: UITableViewCell {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var line: UIView!
    
    private func updateUI() {
        self.backgroundColor = BG_COLOR()
        
        self.titleLabel.textColor = COLOR(articles_titleTextColor_dark,
            articles_titleTextColor_bright)
        self.sourceLabel.textColor = COLOR(articles_sourceTextColor_dark,
            articles_sourceTextColor_bright)
            
        self.flag.layer.cornerRadius = 10
        self.flag.backgroundColor = COLOR(placeHolders_bgColor_dark,
            placeHolders_bgColor_bright)
        self.line.backgroundColor = COLOR(articleTextOnly_separatorColor_dark,
            articleTextOnly_separatorColor_bright)
    }

    func update(article: Article) {
        self.updateUI()
        
        self.titleLabel.text = article.title
        self.flag.image = GET_FLAG(id: article.flag)
        self.sourceLabel.text = article.source + " - " + article.time
    }
    
}
