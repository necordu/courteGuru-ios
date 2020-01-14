//
//  CGCartViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CGCartViewController: UIViewController {
    
    var viewModel: CGCartViewModelProtocol?{
        didSet {
            fillUI()
        }
    }
   
    var disposeBag = DisposeBag()
    @IBOutlet var shopView: UIView!
    @IBOutlet var cartTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = CGCartViewModelIn()
        
        
    }
    
    func fillUI() {
        
        shopView.layer.cornerRadius = 10
        shopView.layer.masksToBounds = false
        shopView.layer.shadowColor = UIColor.black.cgColor
        shopView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        shopView.layer.shadowOpacity = 0.2
        
        viewModel!.getGoods()
        .subscribe(
            onNext: { [weak self] goods in
                self!.viewModel!.goods.accept(goods)
            },
            onError: { error in
                print("error - \(error.localizedDescription)")
            }
        )
        .disposed(by: disposeBag)
        
        self.configureTableView()
        self.setupCellConfiguration()
        
    }
    
    /** Настройка таблицы - UI */
    private func configureTableView() {

        //Поведение ячейки при выборе
        cartTable.rx
            .modelSelected(CGCart.self)
            .subscribe({ value in
                
                
                
            }).disposed(by: disposeBag)
    }
    
    private func setupCellConfiguration() {
        
        viewModel!.goods.asObservable()
            .bind(to: cartTable.rx
                .items(cellIdentifier: CGCartCell.Identifier, cellType: CGCartCell.self)) {
                    row, goods, cell in

                    cell.goods = goods
                    
                    cell.plus.rx.tap
                        .subscribe({ [weak self] _ in
                            
                            cell.goodsCount.text = self!.viewModel?.cartChange(cell.plus, goodCount: Int(cell.goodsCount!.text!)!)
                            cell.priceLabel.text = (self!.viewModel?.countPrice(price: cell.goodPrice, goodCount: cell.goodsCount.text!))! + " " + cell.goodCurrency
                            
                        }).disposed(by: self.disposeBag)
                    
                    cell.minus.rx.tap
                        .subscribe({ [weak self] _ in
                        
                            cell.goodsCount.text = self!.viewModel?.cartChange(cell.minus, goodCount: Int(cell.goodsCount!.text!)!)
                            cell.priceLabel.text = (self!.viewModel?.countPrice(price: cell.goodPrice, goodCount: cell.goodsCount.text!))! + " " + cell.goodCurrency
                        
                    }).disposed(by: self.disposeBag)
                    
                  /*  cell.tasks = tasks
                    
                    cell.favoritesButton.rx.tap
                        .subscribe(onNext: { [weak self] _ in
                            
                           _ = self!.viewModel?.addFavorite(cell.favoritesButton)
                            
                        }).disposed(by: self.disposeBag)*/
                    
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
