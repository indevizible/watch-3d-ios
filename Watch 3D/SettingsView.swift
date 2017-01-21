//
//  SettingsView.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/15/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    @IBOutlet var caseButtons: [UIButton]!
    @IBOutlet var caseColorButtons: [UIButton]!
    @IBOutlet var bandColorButtons: [UIButton]!
    
    var caseColorPalleteAreaViews = [UIView]()
    var bandColorPalleteAreaViews = [UIView]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupDesign()
    }
    
    private func setupDesign() {
        
        for button in caseButtons {
            button.addTarget(self, action:#selector(caseButtonDidPress(button:)), for: .touchUpInside)
            setupContentEdgeInsetsButton(button: button)
            button.rounded()
        }
        
        setButtonSelectedState(views: caseButtons, animated: false)
        
        caseColorPalleteAreaViews = setupColorPalleteArea(buttons: caseColorButtons)
        setColorButtonSelectedState(views: caseColorPalleteAreaViews, animated: false)
        
        for button in caseColorButtons {
            button.addTarget(self, action:#selector(caseColorButtonDidPress(button:)), for: .touchUpInside)
        }
        
        for view in caseColorPalleteAreaViews {
            view.rounded()
        }
        
        bandColorPalleteAreaViews = setupColorPalleteArea(buttons: bandColorButtons)
        setColorButtonSelectedState(views: bandColorPalleteAreaViews, animated: false)
        
        for button in bandColorButtons {
            button.addTarget(self, action:#selector(bandColorButtonDidPress(button:)), for: .touchUpInside)
        }
        
        for view in bandColorPalleteAreaViews {
            view.rounded()
        }
    }
    
    func caseButtonDidPress(button: UIButton) {
        if let indexValue = caseButtons.index(of: button) {
            setButtonSelectedState(views: caseButtons, index: indexValue)
        }
    }
    
     func caseColorButtonDidPress(button: UIButton) {
        if let indexValue = caseColorButtons.index(of: button) {
            setColorButtonSelectedState(views: caseColorPalleteAreaViews, index: indexValue)
        }
    }
    
     func bandColorButtonDidPress(button: UIButton) {
        if let indexValue = bandColorButtons.index(of: button) {
            setColorButtonSelectedState(views: bandColorPalleteAreaViews, index: indexValue)
        }
    }
    
    private func setupColorPalleteArea(buttons: [UIButton]) -> [UIView] {

        return buttons.map {
            $0.backgroundColor = UIColor.clear
            let palleteAreaView = UIView(frame: $0.bounds)
            palleteAreaView.isUserInteractionEnabled = false
            palleteAreaView.clipsToBounds = true
            palleteAreaView.backgroundColor = UIColor.red
            $0.addSubview(palleteAreaView)
            return $0 as UIView
        }
    }
    
    private func setupContentEdgeInsetsButton(button: UIButton){
        let radiusValue = button.bounds.height / 2
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: radiusValue, bottom: 0, right: radiusValue)
        
    }
    
    private func setColorButtonSelectedState(views: [UIView], index: Int = 0, animated:Bool = true){
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                let scaleValue = views.index(of: view) == index ? CGAffineTransform(scaleX: 1, y: 1) : CGAffineTransform(scaleX: 0.5, y: 0.5)
                view.transform = scaleValue
            }
        }, animated: animated)
        
        
    }
    
    private func setButtonSelectedState(views: [UIView], index: Int = 0, animated:Bool = true){
        
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                let isSelected = views.index(of: view) == index
                let backgroundColor = isSelected ? Constants.designs.colors.whiteMuted : Constants.designs.colors.whiteMuted.withAlphaComponent(0)
                let alphaValue: CGFloat = isSelected ? 1 : Constants.designs.colors.disableAlpha
                view.backgroundColor = backgroundColor
                view.alpha = alphaValue
            }
        }, animated: animated)
        
    }
    
}
