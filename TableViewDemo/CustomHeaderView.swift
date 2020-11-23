//
//  CustomHeaderView.swift
//  TableViewDemo
//
//  Created by user on 23/11/2020.
//

import UIKit

protocol HeaderViewDelegate: class {
    func expandedSection(button: UIButton)
}

class CustomHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: HeaderViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    
    func configure(title: String, section: Int) {
        titleLabel.text = title
        headerButton.tag = section
    }
    
    func rotateImage(_ expanded: Bool) {
        if expanded {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } else {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
        
    }
    @IBAction func tapHeader(sender: UIButton) {
        delegate?.expandedSection(button: sender)
    }
}
