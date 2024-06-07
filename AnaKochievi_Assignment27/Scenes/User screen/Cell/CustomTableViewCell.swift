//
//  CustomTableViewCell.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 07.06.24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var cellLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.font = .poppinsRegular(size: 16)
        view.textColor = UIColor(hex: "030303")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
        contentView.backgroundColor = .white
    }
    
    private func setUp() {
        contentView.addSubview(iconImage)
        contentView.addSubview(cellLabel)
    }
    
    private func setUpConstraints() {
        iconImage.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(60 * Constraint.xCoeff)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(17 * Constraint.yCoeff * Constraint.xCoeff)
        }
        cellLabel.snp.remakeConstraints { make in
            make.leading.equalTo(iconImage.snp.trailing).offset(24 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(130 * Constraint.xCoeff)
            make.centerY.equalToSuperview()
        }
    }
    
    func configureCellData(with data: UserData) {
        iconImage.image = data.iconImage
        cellLabel.text = data.cellLabel
    }
}


