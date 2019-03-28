//
//  SubtitleTableViewCell.swift
//  TwoTableViews
//
//
//  Created by Eliana Boado on 3/1/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//


import UIKit;

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

    }

}
