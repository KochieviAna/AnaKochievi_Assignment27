//
//  HeatherView.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 07.06.24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    let xButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "Close"), for: .normal)
        return view
    }()
    
    private let mainImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Avatar1")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Echelon")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let label1: UILabel = {
        let view = UILabel()
        view.text = "Stone Stellar"
        view.numberOfLines = 0
        view.textColor = UIColor(hex: "FA5075")
        view.font = .poppinsBold(size: 16)
        return view
    }()
    
    private let label2: UILabel = {
        let view = UILabel()
        view.text = "Gold Player"
        view.numberOfLines = 0
        view.textColor = UIColor(hex: "F4C73E")
        view.font = .poppinsRegular(size: 10)
        return view
    }()
    
    private let label3: UILabel = {
        let view = UILabel()
        view.text = "Online"
        view.numberOfLines = 0
        view.textColor = UIColor(hex: "36C703")
        view.font = .poppinsRegular(size: 10)
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
        setUpConstraints()
    }
    
    private func setUpViews() {
        addSubview(xButton)
        addSubview(mainImageView)
        addSubview(imageView)
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
    }
    
    private func setUpConstraints() {
        xButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(305 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-44 * Constraint.xCoeff)
            make.width.height.equalTo(25 * Constraint.xCoeff * Constraint.yCoeff)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(60 * Constraint.xCoeff)
            make.width.height.equalTo(57 * Constraint.xCoeff * Constraint.yCoeff)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(98 * Constraint.yCoeff)
            make.leading.equalTo(mainImageView.snp.trailing).offset(11 * Constraint.xCoeff)
            make.width.height.equalTo(10 * Constraint.xCoeff * Constraint.yCoeff)
        }
        
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(71 * Constraint.yCoeff)
            make.leading.equalTo(mainImageView.snp.trailing).offset(11 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-147 * Constraint.xCoeff)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(imageView.snp.trailing).offset(2 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-175 * Constraint.xCoeff)
        }
        
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(mainImageView.snp.trailing).offset(11 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-215 * Constraint.xCoeff)
        }
    }
}
