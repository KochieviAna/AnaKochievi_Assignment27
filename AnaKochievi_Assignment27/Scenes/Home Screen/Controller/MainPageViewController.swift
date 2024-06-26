import UIKit
import SnapKit

class MainPageViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(hex: "FFFFFF")
        view.dataSource = self
        view.delegate = self
        view.register(CustomMainPageCellCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        return view
    }()
    
    private let headerView: CustomHeaderView = {
        let view = CustomHeaderView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        setUpConstraints()
        loadCells()
        
        headerView.clearButton.addTarget(self, action: #selector(pushUserViewController), for: .touchUpInside)
    }
    
    private var customCell: [CustomCellData] = []
    
    private func setUp() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
    }
    
    private func setUpConstraints() {
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60 * Constraint.yCoeff)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func loadCells() {
        customCell = [
            CustomCellData(wrapperImage: UIImage(named: "Rectangle 342")!,
                           mainImage: UIImage(named: "Girl")!,
                           additionalImageOne: UIImage(named: "Cloud")!,
                           additionalImageTwo: UIImage(named: "FilledBubble")!,
                           additionalImageThree: nil,
                           additionalImageFour: nil,
                           titleLabel: "Schedule",
                           descriptionLabel: "Easily schedule event/games then find like minded players for battle. You up for it?"),
            CustomCellData(wrapperImage: UIImage(named: "Rectangle 342")!,
                           mainImage: UIImage(named: "Palls")!,
                           additionalImageOne: nil,
                           additionalImageTwo: nil,
                           additionalImageThree: UIImage(named: "SmallBubble")!,
                           additionalImageFour: UIImage(named: "BigBubble")!,
                           titleLabel: "Statistics",
                           descriptionLabel: "All data from previous and upcoming games can be found here "),
            CustomCellData(wrapperImage: UIImage(named: "Rectangle 342")!,
                           mainImage: UIImage(named: "Telescope")!,
                           additionalImageOne: nil,
                           additionalImageTwo: nil,
                           additionalImageThree: nil,
                           additionalImageFour: nil,
                           titleLabel: "Discover  Combats",
                           descriptionLabel: "Find out what’s new and compete among players with new challenges and earn cash with game points "),
            CustomCellData(wrapperImage: UIImage(named: "Rectangle 342")!,
                           mainImage: UIImage(named: "Friends")!,
                           additionalImageOne: nil,
                           additionalImageTwo: nil,
                           additionalImageThree: nil,
                           additionalImageFour: nil,
                           titleLabel: "Message Players",
                           descriptionLabel: "Found the profile of a player that interests you? Start a conversation"),
        ]
        collectionView.reloadData()
    }
    
    @objc func pushUserViewController() {
        let userVC = UserViewController()
        navigationController?.pushViewController(userVC, animated: true)
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomMainPageCellCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let cellData = customCell[indexPath.item]
        cell.configure(with: cellData)
        return cell
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = collectionViewWidth - 30
        return CGSize(width: cellWidth, height: 169)
    }
}
