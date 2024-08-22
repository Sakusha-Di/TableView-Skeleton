//
//  CustomTableViewCell.swift
//  TableView+Skeleton
//
//  Created by Ilya Kosov on 29.09.2023.
//

import UIKit
import TinyConstraints
import SkeletonView

class CustomCell: UITableViewCell {
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    
    let backView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabels()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLabels() {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        self.isSkeletonable = true
        self.contentView.isSkeletonable = true
        self.backView.isSkeletonable = true
        stackView.isSkeletonable = true
        
        self.label1.isSkeletonable = true
        self.label2.isSkeletonable = true
        self.label3.isSkeletonable = true
        self.label4.isSkeletonable = true
        
        contentView.addSubview(backView)
        contentView.backgroundColor = .systemBackground
        backView.edgesToSuperview(insets: .uniform(8))
        backView.layer.cornerRadius = 8
        backView.backgroundColor = .systemGray6
        
        backView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .uniform(8))
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(label4)
    }
}
