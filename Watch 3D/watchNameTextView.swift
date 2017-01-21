//
//  watchNameTextView.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/20/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit

class WatchNameTextView: UIView {
    @IBOutlet weak var watchNameLabel: UILabel!
    
    var watchNameText: String = ""
    
    override func awakeFromNib() {
        watchNameLabel.text = watchNameText
    }
    
}
