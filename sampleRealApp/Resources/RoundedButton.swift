//
//  RoundedButton.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/27/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        // code for button goes here
        layer.cornerRadius = 13
        layer.masksToBounds = true

    }
}
