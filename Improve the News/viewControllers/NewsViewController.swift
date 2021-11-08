//
//  NewsViewController.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import UIKit


class NewsViewController: NewsBaseViewController {

    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var listBottomConstraint: NSLayoutConstraint!
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fixSafeAreaBottom()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DELAY(0.1) {
            self.loadData()
        }
    }
}


// UI
extension NewsViewController {
    
    func fixSafeAreaBottom() {
        let bottom = SAFE_AREA().bottom
        if(bottom > 0) {
            self.listBottomConstraint.constant = -bottom
        }
    }
    
}
