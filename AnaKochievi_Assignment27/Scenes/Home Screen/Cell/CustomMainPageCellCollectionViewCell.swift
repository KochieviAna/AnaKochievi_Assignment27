//
//  CustomMainPageCellCollectionViewCell.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 06.06.24.
//

import UIKit
import SnapKit

class CustomMainPageCellCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.font = .poppinsBold(size: 12)
        view.textColor = UIColor(hex: "FFFFFF")
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.font = .poppinsRegular(size: 10)
        view.textColor = UIColor(hex: "FFFFFF")
        return view
    }()
    private lazy var arrowButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        view.tintColor = UIColor(hex: "FFFFFF")
        return view
    }()
    private lazy var wrapperImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var mainImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var additionalImageOne: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var additionalImageTwo: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var additionalImageThree: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    private lazy var additionalImageFour: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp() {
        contentView.addSubview(wrapperImage)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(additionalImageOne)
        contentView.addSubview(additionalImageTwo)
        contentView.addSubview(additionalImageThree)
        contentView.addSubview(additionalImageFour)
    }
    
    private func setUpConstraints() {
        wrapperImage.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(30 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(24 * Constraint.xCoeff)
            make.height.equalTo(18 * Constraint.yCoeff)
        }
        descriptionLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(24 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-148 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
            make.width.equalTo(165 * Constraint.xCoeff)
        }
        arrowButton.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(-24 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(24 * Constraint.xCoeff)
            make.height.equalTo(9.33 * Constraint.yCoeff)
            make.width.equalTo(14 * Constraint.xCoeff)
        }
        additionalImageOne.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(10.71 * Constraint.yCoeff)
            make.trailing.equalToSuperview().offset(-53 * Constraint.xCoeff)
            make.height.equalTo(5 * Constraint.yCoeff)
            make.width.equalTo(28 * Constraint.xCoeff)
        }
        additionalImageTwo.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(32 * Constraint.yCoeff)
            make.trailing.equalToSuperview().offset(-77 * Constraint.xCoeff)
            make.height.equalTo(6 * Constraint.yCoeff)
            make.width.equalTo(6 * Constraint.xCoeff)
        }
        additionalImageThree.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(36 * Constraint.yCoeff)
            make.trailing.equalToSuperview().offset(-95 * Constraint.xCoeff)
            make.height.equalTo(8 * Constraint.yCoeff)
            make.width.equalTo(8 * Constraint.xCoeff)
        }
        additionalImageFour.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(14 * Constraint.yCoeff)
            make.trailing.equalToSuperview().offset(-22 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
            make.width.equalTo(18 * Constraint.xCoeff)
        }
        mainImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(43 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(168 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-12 * Constraint.xCoeff)
            make.bottom.equalToSuperview().offset(-19 * Constraint.yCoeff)
            make.height.equalTo(107 * Constraint.yCoeff)
            make.width.equalTo(112 * Constraint.xCoeff)
            }
    }
    
    func configure(with data: CustomCellData){
        wrapperImage.image = data.wrapperImage
        titleLabel.text = data.titleLabel
        descriptionLabel.text = data.descriptionLabel
        additionalImageOne.image = data.additionalImageOne
        additionalImageTwo.image = data.additionalImageTwo
        additionalImageThree.image = data.additionalImageThree
        additionalImageFour.image = data.additionalImageFour
        mainImage.image = data.mainImage
        
    }
}
