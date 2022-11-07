//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by ntubic on 04.11.2022..
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: self.frame.width - 20, height: 110))
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let date = UILabel(frame: CGRect(x: 10, y: 8, width: self.frame.width - 116, height: 30))
        date.textAlignment = .left
        date.font = UIFont.boldSystemFont(ofSize: 18)
        return date
    }()
    lazy var amountLabel: UILabel = {
        let date = UILabel(frame: CGRect(x: 116, y: 74, width: self.frame.width - 116, height: 30))
        date.textAlignment = .left
        return date
    }()
    lazy var dateLabel: UILabel = {
        let date = UILabel(frame: CGRect(x: 116, y: 42, width: self.frame.width - 116, height: 30))
        date.textAlignment = .left
        return date
    }()
    lazy var typeLabel: UILabel = {
        let date = UILabel(frame: CGRect(x: 116, y: 106, width: self.frame.width - 116, height: 30))
        date.textAlignment = .left
        return date
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(dateLabel)
        backView.addSubview(descriptionLabel)
        backView.addSubview(amountLabel)
        backView.addSubview(typeLabel)
    }

}

