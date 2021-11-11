//
//  NewsViewController_LIST.swift
//  Improve the News
//
//  Created by Federico Lopez on 11/11/2021.
//

import Foundation
import UIKit


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
            case .articleTextOnly:
                cell = cell_articleTextOnly(index: item.topicIndex,
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
}


extension NewsViewController {

    // MARK: - Cells
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
    
    func cell_articleTextOnly(index: Int, subIndex: Int) -> ArticleTextOnly {
        let cell = self.list.dequeueReusableCell(withIdentifier:
            "ArticleTextOnly") as! ArticleTextOnly
            
        cell.update(article: self.topics[index].articles[subIndex])
        return cell
    }
    
    func cell_footerDenseIntense(index: Int) -> FooterDenseIntense {
        let cell = self.list.dequeueReusableCell(withIdentifier: "FooterDenseIntense")
            as! FooterDenseIntense
        
        var showSeparator = true
        if(CommonData.shared.selectedLayout == .denseIntense && index==0){ showSeparator = false }
        if(CommonData.shared.selectedLayout == .textOnly){ showSeparator = false }
        cell.update(topicName: self.topics[index].nameToDisplay, separator: showSeparator)
        return cell
    }
    
    func cell_footerAbout() -> FooterAbout {
        let cell = self.list.dequeueReusableCell(withIdentifier: "FooterAbout")
            as! FooterAbout
        cell.updateUI()
        return cell
    }
}


extension NewsViewController {

    // MARK: - misc
    func initList() {
        self.list.delegate = self
        self.list.dataSource = self
        self.list.separatorStyle = .none //.singleLine
        self.list.separatorColor = DARK_MODE() ? .white : .black
        self.list.indicatorStyle = DARK_MODE() ? .white : .black
        self.list.tableFooterView = UIView()
        
        var nibs = [String]()
        nibs.append("HeaderDenseIntenseZero")
        nibs.append("HeaderDenseIntense")
        nibs.append("ArticleDenseIntense")
        nibs.append("ArticleTextOnly")
        nibs.append("FooterDenseIntense")
        nibs.append("FooterAbout")
        
        for N in nibs {
            let nib = UINib(nibName: N, bundle: nil)
            self.list.register(nib, forCellReuseIdentifier: N)
        }
    }
    
    func reloadList() {
        DispatchQueue.main.async {
            self.list.reloadData()
        }
    }

}
