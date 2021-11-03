//
//  NewsViewController.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import UIKit

class NewsViewController: UIViewController {

    var uniqueID = -1

    static func instantiateFromStoryboard() -> NewsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "idNews") as! NewsViewController
    }

    // MARK: - Init
    override func viewDidLoad() {
        CommonData.shared.currentUniqueId += 1
        self.uniqueID = CommonData.shared.currentUniqueId
        
        self.initNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UPDATE_STATUSBAR_COLOR(navBar: self.navigationController?.navigationBar)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DELAY(2.0) {
            if(self.uniqueID==1) {
                let vc = NewsViewController.instantiateFromStoryboard()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }

}


// UI customization
extension NewsViewController {
    
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
