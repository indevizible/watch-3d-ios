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
    
    
    var basedColor: UIColor = UIColor.gray
    var indicatorColor: UIColor = UIColor.darkGray
    
    var isRounded: Bool = false
    
    let indicatorView: UIView = UIView()
    var widthConstraint = NSLayoutConstraint()

    var contentLength: CGFloat = 2 {
        didSet{
            self.widthConstraint.constant = visibleLength / contentLength * self.bounds.width
        }
    }
    var visibleLength: CGFloat = 1
    
    var contentOffset: CGFloat = 0.0 {
        didSet{
            self.indicatorView.transform.tx = contentOffset / contentLength * self.bounds.width
        }
    }
    
    override func layoutSubviews() {
        setupDesign()
    }
    
    private func setupDesign() {
        
        self.indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.indicatorView)
        
        let widthValue: CGFloat = visibleLength / contentLength * self.bounds.width
        let topConstraint = NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        self.self.widthConstraint = NSLayoutConstraint(item: indicatorView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: widthValue)
        self.addConstraints([topConstraint, bottomConstraint, leadingConstraint, self.widthConstraint])
        
        // set ClipsToBounds
        let cornerRadiusValue = isRounded ? self.bounds.height / 2 : 0
        
        self.layer.cornerRadius = cornerRadiusValue
        indicatorView.layer.cornerRadius = cornerRadiusValue
        
        self.clipsToBounds = true
        indicatorView.clipsToBounds = true
        
        self.backgroundColor = basedColor
        
        indicatorView.backgroundColor = indicatorColor
        
    }
    
    
    
    
}
