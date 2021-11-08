//
//  NewsBaseViewController.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import UIKit


class NewsBaseViewController: UIViewController {

    var api = API()
    var uniqueID = -1
    var topics = [Topic]()
    var dataProvider = [ListItem]()
    

    // MARK: - Init
    override func viewDidLoad() {
        CommonData.shared.currentUniqueId += 1
        self.uniqueID = CommonData.shared.currentUniqueId
        
        self.initNavBar()
    }
    
    func loadData() {
        self.api.loadData { (succed, topics) in
            if(!succed) {
                return
            }
            self.populateDataProvider(topics)
        }
    }
    
    func populateDataProvider(_ topics: [Topic]) {
        self.topics = topics
        self.dataProvider = [ListItem]()
        for (i, topic) in topics.enumerated() {
            let header = ListItem(type: .header, topicIndex: i)
            self.dataProvider.append(header)
            
            // Dense & Intense layout
            for j in 0..<topic.articles.count {
                if (j%2 == 0) {
                    let article = ListItem(type: .article_2columns, topicIndex: i, articleIndex: j)
                    self.dataProvider.append(article)
                }
            }
            
            let footer = ListItem(type: .footer, topicIndex: i)
            self.dataProvider.append(footer)
        }
    }
    

}

// UI customization
extension NewsBaseViewController {
    
    func initNavBar() {
    // StatusBar
        UPDATE_STATUSBAR_COLOR(navBar: self.navigationController?.navigationBar)
        
    // BG Color
        navigationController?.navigationBar.barTintColor = COLOR(navBar_bgColor_dark,
                                                            navBar_bgColor_bright)
        navigationController?.navigationBar.isTranslucent = false
    
    // ITN Logo
        var logoFile = "ITN-logo_whiteText"
        if(BRIGHT_MODE()){ logoFile = "ITN-logo_darkText" }
        let image = UIImage(named: logoFile)?.withRenderingMode(.alwaysOriginal)
        
        let titleView = UIView.init(frame: FRAME(width: 195, height: 30))
        let homeButton = UIButton(type: .system)
        homeButton.setImage(image!, for: .normal)
        homeButton.frame = titleView.frame
        
        titleView.addSubview(homeButton)
        self.navigationItem.titleView = titleView
        
        /*
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = COLOR(navBar_bgColor_dark,
                                            navBar_bgColor_bright)
            //appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "PlayfairDisplay-SemiBold", size: 26)!, NSAttributedString.Key.foregroundColor: _textColor]
            
            
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        */
    }
}
