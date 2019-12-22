//
//  OrderView.swift
//  curier
//
//  Created by Чернецова Юлия on 21/12/2019.
//  Copyright © 2019 GB team. All rights reserved.
//

import UIKit
import SnapKit

class  OrderView: UIView {
    let margin = 8
    
   // MARK Элементы UI
  let orderId = UITextField()
  let orderIdLabel = UILabel()
  let orderAdressLabel = UILabel()
  let orderAddress = UITextView(frame: CGRect(x:200, y:200, width:160, height:200))
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    func configureUI() {
        self.backgroundColor = .white
        self.addOrderID()
        self.addAddress()
    }
    func addOrderID(){
        //OrderID
        self.orderIdLabel.translatesAutoresizingMaskIntoConstraints = false
        self.orderIdLabel.backgroundColor = .white
        self.orderIdLabel.text = "Номер заказа:"
        self.orderIdLabel.textColor = UIColor.black
        self.orderIdLabel.textAlignment = .right
        self.orderIdLabel.font = UIFont.systemFont(ofSize: 17.0)
        self.addSubview(orderIdLabel)
        self.orderId.translatesAutoresizingMaskIntoConstraints = false
        self.orderId.backgroundColor = .white
        self.orderId.text = "2"
        self.orderId.textColor = UIColor.black
        self.orderId.textAlignment = .center
        self.orderId.font = UIFont.systemFont(ofSize: 17.0)
        self.addSubview(orderId)
    }
    func addAddress() {
        self.orderAdressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.orderAdressLabel.backgroundColor = .white
        self.orderAdressLabel.text = "Адрес:"
        self.orderAdressLabel.textColor = UIColor.black
        self.orderAdressLabel.textAlignment = .right
        self.orderAdressLabel.font = UIFont.systemFont(ofSize: 17.0)
        self.addSubview(orderAdressLabel)
        
        self.orderAddress.translatesAutoresizingMaskIntoConstraints = false
        self.orderAddress.layer.cornerRadius = 25
        self.orderAddress.backgroundColor = .green
        self.orderAddress.text = "Здесь должен быть адрес объекта доставки курьером"
        self.orderAddress.font = UIFont.systemFont(ofSize: 17.0)
         self.addSubview(orderAddress)
    }
    func setupConstraints()  {
        let midX = 140
        orderAdressLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(self.superview!)
            make.width.equalTo(midX)
            make.top.equalTo(self.orderIdLabel.snp.bottom).offset(self.margin)
            make.height.equalTo(50)
        }
        orderAddress.snp.makeConstraints{ (make) in
            make.left.equalTo(self.orderAdressLabel.snp.right)
             make.right.equalTo(self.superview!)
            make.top.equalTo(self.orderIdLabel.snp.bottom).offset(self.margin)
            make.height.equalTo(200)
        }
        orderIdLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(self.superview!)
            make.width.equalTo(midX)
            make.top.equalTo(self.superview!).offset(70)
            make.height.equalTo(50)
        }
        orderId.snp.makeConstraints{ (make) in
            make.left.equalTo(self.orderIdLabel.snp.right).offset(self.margin)
            make.right.equalTo(self.superview!)
            make.top.equalTo(self.superview!).offset(70)
            make.height.equalTo(50)
            
        }
    }
}
