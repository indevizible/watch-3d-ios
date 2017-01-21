//
//  welcomeScreenVC.swift
//  Gro Design
//
//  Created by VIRAKRI JINANGKUL on 10/17/16.
//  Copyright © 2016 VIRAKRI JINANGKUL. All rights reserved.
//

import Foundation
import UIKit



class ScrollLineIndicator: UIView {
    
    var basedColor: UIColor = .gray {
        didSet {
            backgroundColor = basedColor
        }
    }
    var indicatorColor: UIColor = .darkGray {
        didSet {
            indicatorView.backgroundColor = indicatorColor
        }
    }
    
    var isRounded = false {
        didSet {
            let cornerRadiusValue = isRounded ? bounds.height / 2 : 0
            
            layer.cornerRadius = cornerRadiusValue
            indicatorView.layer.cornerRadius = cornerRadiusValue
        }
    }
    
    let indicatorView = UIView()
    var widthConstraint = NSLayoutConstraint()

    var contentLength: CGFloat = 2 {
        didSet{
            widthConstraint.constant = visibleLength / contentLength * self.bounds.width
        }
    }
    var visibleLength: CGFloat = 1
    
    var contentOffset: CGFloat = 0.0 {
        didSet{
            indicatorView.transform.tx = contentOffset / contentLength * self.bounds.width
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    private func setupDesign() {
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.indicatorView)
        
        let widthValue: CGFloat = visibleLength / contentLength * self.bounds.width
        let attrs: [NSLayoutAttribute] = [.top, .bottom, .leading]
        var constrants = attrs.map {
            NSLayoutConstraint(item: indicatorView,
                               attribute: $0,
                               relatedBy: .equal, toItem: self,
                               attribute: $0,
                               multiplier: 1, constant: 0)
        }

        widthConstraint = NSLayoutConstraint(item: indicatorView,
                                             attribute: .width,
                                             relatedBy: .equal, toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1, constant: widthValue)
        constrants.append(widthConstraint)
        self.addConstraints(constrants)
        
        // set ClipsToBounds
        isRounded = false
        
        clipsToBounds = true
        indicatorView.clipsToBounds = true
        
        backgroundColor = basedColor
        indicatorView.backgroundColor = indicatorColor
        setNeedsUpdateConstraints()
        setNeedsLayout()
        
    }
}
