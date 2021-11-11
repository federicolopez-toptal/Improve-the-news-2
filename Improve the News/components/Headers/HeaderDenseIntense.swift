//
//  HeaderDenseIntense.swift
//  Improve the News
//
//  Created by Federico Lopez on 09/11/2021.
//

import UIKit

class HeaderDenseIntense: UITableViewCell {

    @IBOutlet weak var topicNameButton: UIButton!
    @IBOutlet weak var hierarchyView: UIView!
    
    private let hierarchyTextColor_dark = UIColor(rgb: 0x334262)
    private let hierarchyTextColor_bright = UIColor.black.withAlphaComponent(0.3)
    
    
    private func updateUI() {
        self.backgroundColor = BG_COLOR()
        
        self.selectionStyle = .none
        self.topicNameButton.setTitleColor(headers_mainTextColor, for: .normal)
        self.topicNameButton.titleLabel?.font = UIFont(name: "PTSerif-Bold", size: 30)
        self.topicNameButton.titleLabel?.minimumScaleFactor = 0.5
        self.topicNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func addHierarchyButtons(hierarchy: [Hierarchy]) {
        self.hierarchyView.backgroundColor = .clear
        self.hierarchyView.subviews.forEach({ $0.removeFromSuperview() })
        
        var j = 0
        for (i, H) in hierarchy.enumerated() {
            let button = UIButton(type: .system)
            button.tag = j; j += 1
            button.setTitle(H.topicNameToDisplay, for: .normal)
            button.backgroundColor = .clear
            self.hierarchyView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            if(i==0) {
                button.leadingAnchor.constraint(equalTo: self.hierarchyView.leadingAnchor).isActive = true
            } else {
                let prevComponent = self.hierarchyView.viewWithTag(j-2) as! UIView
                button.leadingAnchor.constraint(equalTo: prevComponent.trailingAnchor, constant: 3).isActive = true
            }
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: self.hierarchyView.topAnchor),
                button.heightAnchor.constraint(equalToConstant: 15)
            ])
            
            button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 13)
            button.setTitleColor(self.hierarchyTextColor_dark, for: .normal)
            if(BRIGHT_MODE()){
                button.setTitleColor(self.hierarchyTextColor_bright, for: .normal)
            }; button.sizeToFit()
            
            if(hierarchy.count>0 && i<hierarchy.count-1) {
                let arrow = UILabel()
                arrow.tag = j; j += 1
                arrow.text = ">"
                arrow.backgroundColor = .clear
                arrow.font = button.titleLabel?.font
                arrow.textColor = button.titleLabel?.textColor
                
                self.hierarchyView.addSubview(arrow)
                arrow.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    arrow.topAnchor.constraint(equalTo: self.hierarchyView.topAnchor),
                    arrow.heightAnchor.constraint(equalToConstant: 15),
                    arrow.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 3)
                ])
                arrow.sizeToFit()
            }
        }
    }
    
    func update(topicName: String, hierarchy: [Hierarchy]) {
        self.updateUI()
        self.topicNameButton.setTitle(topicName, for: .normal)
        self.addHierarchyButtons(hierarchy: hierarchy)
    }
    
}
