//
//  StanceMiniSliders.swift
//  Improve the News
//
//  Created by Federico Lopez on 11/11/2021.
//

import Foundation
import UIKit

class StanceMiniSliders {

    private var factor: CGFloat = 1.0
    private let dim: CGFloat = 35.0
    private let thumbDim: CGFloat = 8.0

    private let line1 = UIView(frame: CGRect.zero)
    private let line2 = UIView(frame: CGRect.zero)
    private let thumb1 = UIView(frame: CGRect.zero)
    private let thumb2 = UIView(frame: CGRect.zero)

    init(into containerView: UIView, factor: CGFloat = 1.0) {
        self.factor = factor
    
        containerView.backgroundColor = BG_COLOR()
            
        containerView.layer.cornerRadius = 15.0
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        line1.frame = CGRect(x: 3 * factor, y: 12 * factor,
            width: (dim-12)*factor, height: 2*factor)
        line1.backgroundColor = COLOR(stanceMiniSliders_lineColor_dark,
            stanceMiniSliders_lineColor_bright)
        line1.layer.cornerRadius = 2 * factor
        containerView.addSubview(line1)
        
        line2.frame = CGRect(x: 3 * factor, y: 26 * factor,
            width: (dim-12)*factor, height: 2 * factor)
        line2.backgroundColor = line1.backgroundColor
        line2.layer.cornerRadius = 2 * factor
        containerView.addSubview(line2)
        
        thumb1.frame = CGRect(x: 0, y: 0, width: thumbDim * factor,
            height: thumbDim * factor)
        thumb1.layer.cornerRadius = 4 * factor
        thumb1.backgroundColor = COLOR(stanceMiniSliders_thumbColor_dark,
            stanceMiniSliders_thumbColor_bright)
        line1.addSubview(thumb1)
        thumb2.frame = CGRect(x: 0, y: 0, width: thumbDim * factor,
            height: thumbDim * factor)
        thumb2.layer.cornerRadius = 4 * factor
        thumb2.backgroundColor = thumb1.backgroundColor
        line2.addSubview(thumb2)
        
        self.setValues(val1: 1, val2: 1)
    }
    
    func setValues(val1: Int, val2: Int, source: String = "", countryID: String = "") {
        var val: Int
        //var posX: CGFloat
        var mFrame: CGRect
        
        val = val1
        if(val<1){ val = 1 }
        else if(val>5){ val = 5 }
        
        /*
        self.textOnTap = "<SOURCE>"
        if(!source.isEmpty) {
            var lastIndex = source.count-1
            
            let parts = source.components(separatedBy: "#")
            if let part_1 = parts.first {
                lastIndex = part_1.count-2
            }
            
            let cleanSource = source[0...lastIndex]
            self.textOnTap = self.textOnTap.replacingOccurrences(of: "<SOURCE>", with: cleanSource)
        }
        self.textOnTap += self.NATIONALITY_forID(countryID)
        self.textOnTap += "has a " + LR_text(val) + " and "
        */
        
        let tDim = self.thumbDim * self.factor
        mFrame = thumb1.frame
        mFrame.origin.y = -3 * self.factor
        mFrame.origin.x = ((line1.frame.size.width-(tDim/2))/5) * CGFloat((val-1))
        thumb1.frame = mFrame
        
        //val = Int.random(in: 1...5)  // <-- For testing purposes
        val = val2
        if(val<1){ val = 1 }
        else if(val>5){ val = 5 }
        
        //self.textOnTap += PE_text(val) + " stance"
        
        mFrame = thumb2.frame
        mFrame.origin.y = -3 * factor
        mFrame.origin.x = ((line2.frame.size.width-(tDim/2))/5) * CGFloat((val-1))
        thumb2.frame = mFrame
    }

}
