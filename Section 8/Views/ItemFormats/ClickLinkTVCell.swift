//
//  ClickLinkTVCell.swift
//  Section 8
//
//  Created by Arkin Hill on 11/30/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit

class ClickLinkTVCell: UITableViewCell {
    
    var url: URL?
    
    // MARK: - SET DELEGATE
    
    // Set delegate to protocol in child
    // (Step 2 of 5 - 3 steps in child (this file), 2 in parent)
    
    weak var delegate: ClickLinkTVCellDelegate?
    
    
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
        } else {
            
            // Call the delegate function
            // (Step 3 of 5 - 3 steps in child (this file), 2 in parent)
            
            delegate?.clickLinkButtonTapped(self)
        }
    }
}

// MARK: - CUSTOM PROTOCOL FOR DELEGATE

// Create custom protocol for delegate so we can collect data in custom view and pass it to view controller
// (Step 1 of 5 - 3 steps in child (this file), 2 in parent)

protocol ClickLinkTVCellDelegate: class {
    func clickLinkButtonTapped(_ sender: ClickLinkTVCell)
}
