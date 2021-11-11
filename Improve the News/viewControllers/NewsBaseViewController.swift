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
    
    func loadData(callback: @escaping (Bool) ->()) {
        self.api.loadData { (succed, topics) in
            if(!succed) {
                callback(false)
                return
            }
            
            self.populateDataProvider(topics)
            callback(true)
        }
    }
    
}

// DataProvider for UI
extension NewsBaseViewController {

    func populateDataProvider(_ topics: [Topic]) {
        self.topics = topics
        self.dataProvider = [ListItem]()
        for (i, topic) in topics.enumerated() {
        
            // Header
            let header = ListItem(type: self.headerType(index: i), topicIndex: i)
            self.dataProvider.append(header)
            
            // Articles
            if(CommonData.shared.selectedLayout == .denseIntense) {
                // 1 item -> 2 articles
                for j in 0..<topic.articles.count {
                    if (j%2 == 0) {
                        let article = ListItem(type: .articleDenseIntense,
                            topicIndex: i, articleIndex: j)
                        self.dataProvider.append(article)
                    }
                }
            } else {
                // 1 item -> 1 article
                for j in 0..<topic.articles.count {
                    let article = ListItem(type: self.articleType(),
                            topicIndex: i, articleIndex: j)
                    self.dataProvider.append(article)
                }
            }

            /*
            // Footer
            let footer = ListItem(type: self.footerType(), topicIndex: i)
            self.dataProvider.append(footer)
            */
        }
    }
    
    private func headerType(index: Int) -> ListItemType {
        switch CommonData.shared.selectedLayout {
            case .denseIntense:
                if(index==0) {
                    return .headerDenseIntenseZero
                } else {
                    return .headerDenseIntense
                }
            default:
                return .headerDenseIntense
        }
    }
    
    private func articleType() -> ListItemType {
        switch CommonData.shared.selectedLayout {
            case .denseIntense:
                return .articleDenseIntense
            default:
                return .articleDenseIntense
        }
    }
    
    private func footerType() -> ListItemType {
        switch CommonData.shared.selectedLayout {
            case .denseIntense:
                return .footerDenseIntense
            default:
                return .footerDenseIntense
        }
    }
    
    func checkListItemType(_ index: Int, type: ListItemType) -> Bool {
        return self.dataProvider[index].type == type
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
