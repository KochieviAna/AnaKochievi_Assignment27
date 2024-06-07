import UIKit
import SnapKit

class CustomHeaderView: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Avatar")
        return view
    }()
    
    let clearButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Stone Stellar", for: .normal)
        view.setTitleColor(UIColor(hex: "030303"), for: .normal)
        view.backgroundColor = .clear
        view.titleLabel?.numberOfLines = 0
        view.titleLabel?.font = .poppinsRegular(size: 10)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(clearButton)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(263 * Constraint.xCoeff)
            make.trailing.equalTo(clearButton.snp.leading).offset(-1 * Constraint.xCoeff)
            make.width.equalTo(24 * Constraint.xCoeff)
            make.height.equalTo(22 * Constraint.yCoeff)
        }
        
        clearButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20 * Constraint.yCoeff)
            make.leading.equalTo(imageView.snp.trailing).offset(1 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-27 * Constraint.xCoeff)
        }
    }
}
