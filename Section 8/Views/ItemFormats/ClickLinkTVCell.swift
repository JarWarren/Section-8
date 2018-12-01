//
//  ClickLinkTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/30/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class ClickLinkTVCell: UITableViewCell {

    // MARK: - OUTLETS
    
    @IBOutlet weak var clickLinkTextLabel: UILabel!
    @IBOutlet weak var clickLinkButtonText: UIButton!
    
    // MARK: - ACTIONS
    
    @IBAction func clickLinkButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
