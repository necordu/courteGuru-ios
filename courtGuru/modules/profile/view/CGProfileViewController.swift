//
//  CGProfileViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class CGProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var historyCollection: UICollectionView!
    var disposeBag = DisposeBag()
    
    var viewModel: CGProfileViewModelProtocol?{
        didSet {
            fillUI()
        }
    }
    
    //var dataSource = RxCollectionViewDataSourceType

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = CGProfileViewModelIn()
        // Do any additional setup after loading the view.
    }
    
    func fillUI() {
        
        avatarView.snp.makeConstraints { (make) in
            
            make.leading.equalToSuperview()
            make.top.equalTo(30)
            make.width.height.equalTo(70)
            
        }
        
        nameLabel.snp.makeConstraints { (make) in
            
        make.leading.equalTo(avatarView.snp.trailing).offset(5)
            make.top.equalTo(avatarView.snp.top)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(16)
            
        }
        nameLabel.text = "Name named"
        
        descLabel.numberOfLines = 3
        descLabel.snp.makeConstraints { (make) in
            
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-5)
            
            
        }
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.text = "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello "
        descLabel.sizeToFit()
        
        titleLabel.text = "Ваш заказ"
        titleLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.top.equalTo(avatarView.snp.bottom).offset(10)
            make.height.equalTo(16)
            
        }
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        
        historyCollection.snp.makeConstraints { (make) in
            
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(170)
            
        }
        historyCollection.layer.borderWidth = 1.0
        historyCollection.layer.borderColor = UIColor.lightGray.cgColor
        historyCollection.alwaysBounceVertical = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        historyCollection.collectionViewLayout = layout
        historyCollection.rx.setDelegate(self).disposed(by: disposeBag)
    
        self.setupCellConfiguration()
        
    }
    
    private func setupCellConfiguration() {
        
        viewModel!.goods.asObservable()
            .bind(to: historyCollection.rx
                .items(cellIdentifier: CGHistoryCell.Identifier, cellType: CGHistoryCell.self)) {
                    row, goods, cell in

                    cell.goods = goods
                    
            }
            .disposed(by: disposeBag)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CGProfileViewController: UICollectionViewDelegateFlowLayout {
    
    @objc(collectionView:layout:sizeForItemAtIndexPath:)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 60, height: 150)
    }
    
}

class CGHistoryCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    static let Identifier = "historyCell"
    
    var goods: CGCart? {
        didSet{
            guard let good = goods else { return }
            
            self.titleLabel.text = good.name
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        contentView.backgroundColor = UIColor.lightGray
        
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.snp.makeConstraints { (make) in
            
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            
        }
        
        
    }
    
}
