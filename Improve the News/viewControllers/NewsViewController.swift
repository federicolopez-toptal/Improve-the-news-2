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

        self.initUI()
        self.initList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fixSafeAreaBottom()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DELAY(0.1) {
            self.loadData() { (succed) in
                if(!succed) {
                    // Mostrar cartel de error
                    return
                }
                self.reloadList()
            }
        }
    }
}


// UI
extension NewsViewController {
    
    private func initUI() {
        self.view.backgroundColor = BG_COLOR()
        self.list.backgroundColor = self.view.backgroundColor
    }
    
    private func initList() {
        self.list.delegate = self
        self.list.dataSource = self
        self.list.separatorStyle = .none //.singleLine
        self.list.separatorColor = DARK_MODE() ? .white : .black
        self.list.indicatorStyle = DARK_MODE() ? .white : .black
        self.list.tableFooterView = UIView()
        
        var nibs = [String]()
        if(CommonData.shared.selectedLayout == .denseIntense) {
            nibs.append("HeaderDenseIntenseZero")
            nibs.append("HeaderDenseIntense")
            nibs.append("ArticleDenseIntense")
            nibs.append("FooterDenseIntense")
            nibs.append("FooterAbout")
        }
        
        for N in nibs {
            let nib = UINib(nibName: N, bundle: nil)
            self.list.register(nib, forCellReuseIdentifier: N)
        }
    }
    
    private func reloadList() {
        DispatchQueue.main.async {
            self.list.reloadData()
        }
    }
    
    private func fixSafeAreaBottom() {
        let bottom = SAFE_AREA().bottom
        if(bottom > 0) {
            self.listBottomConstraint.constant = -bottom
        }
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        
        return self.dataProvider.count
    }

    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // CELL
        
        var cell: UITableViewCell?
        
        let item = self.dataProvider[indexPath.row]        
        switch item.type {
            case .headerDenseIntenseZero:
                cell = cell_headerDenseIntenseZero(index: item.topicIndex)
            case .headerDenseIntense:
                cell = cell_headerDenseIntense(index: item.topicIndex)
            case .articleDenseIntense:
                cell = cell_articleDenseIntense(index: item.topicIndex,
                    subIndex: item.articleIndex!)
            case .footerDenseIntense:
                cell = cell_footerDenseIntense(index: item.topicIndex)
            case .footerAbout:
                cell = cell_footerAbout()
                
                
            default:
                cell = cell_headerDenseIntenseZero(index: item.topicIndex)
        }
            
        return cell!
    }
    
    func tableView(_ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {

        return floor(self.dataProvider[indexPath.row].type.rawValue)
    }

    // -----------------------------------
    func cell_headerDenseIntenseZero(index: Int) -> HeaderDenseIntenseZero {
        let cell = self.list.dequeueReusableCell(withIdentifier:
            "HeaderDenseIntenseZero") as! HeaderDenseIntenseZero
                
        cell.update(topicName: self.topics[index].nameToDisplay)
        return cell
    }
    
    func cell_headerDenseIntense(index: Int) -> HeaderDenseIntense {
        let cell = self.list.dequeueReusableCell(withIdentifier:
            "HeaderDenseIntense") as! HeaderDenseIntense

        cell.update(topicName: self.topics[index].nameToDisplay,
            hierarchy: self.topics[index].hierarchy)
        return cell
    }
    
    func cell_articleDenseIntense(index: Int, subIndex: Int) -> ArticleDenseIntense {
        let cell = self.list.dequeueReusableCell(withIdentifier:
            "ArticleDenseIntense") as! ArticleDenseIntense
            
        cell.update(article1: self.topics[index].articles[subIndex],
            article2: self.topics[index].articles[subIndex+1])
        return cell
    }
    
    func cell_footerDenseIntense(index: Int) -> FooterDenseIntense {
        let cell = self.list.dequeueReusableCell(withIdentifier: "FooterDenseIntense") as! FooterDenseIntense
        
        let line = (index==0) ? false : true
        cell.update(topicName: self.topics[index].nameToDisplay, line: line)
        return cell
    }
    
    func cell_footerAbout() -> FooterAbout {
        let cell = self.list.dequeueReusableCell(withIdentifier: "FooterAbout") as! FooterAbout
        cell.updateUI()
        return cell
    }

}
