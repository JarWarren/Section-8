//
//  ClickLinkTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/30/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class ClickLinkTVCell: UITableViewCell {
    
    // MARK: - DELEGATE
    
    var url: URL?
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var clickLinkTitleLabel: UILabel!
    @IBOutlet weak var clickLinkTextLabel: UILabel!
    @IBOutlet weak var clickLinkButtonText: UIButton!
    
    // MARK: - ACTIONS
    
    @IBAction func clickLinkButtonTapped(_ sender: UIButton) {
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
