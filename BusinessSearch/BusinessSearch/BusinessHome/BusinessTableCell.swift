//
//  BusinessCollectionCell.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 17/05/23.
//

import Foundation
import DesignKit
import NetworkKit
import Kingfisher

class BusinessTableCell: UITableViewCell {
    
    var imgPlace: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Baker Street"
        return label
    }()
    
    var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Baker Street"
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "$$"
        return label
    }()
    
    var distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "10 Km"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(imgPlace)
        addSubview(phoneLabel)
        addSubview(distanceLabel)
        
        imgPlace.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(60)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imgPlace.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(imgPlace.snp.top)
        }
        
        distanceLabel.snp.makeConstraints { make in
            make.left.equalTo(imgPlace.snp.right).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.right.equalToSuperview().offset(-16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(imgPlace.snp.right).offset(16)
            make.bottom.equalTo(imgPlace.snp.bottom)
        }
    }
    
    func updateView(data: ListBusiness) {
        let rating = data.getRating()
        let price = data.getPrice()
        let distance = "📍" + data.getDistance() + " KM"
        
        nameLabel.text = data.name
        distanceLabel.text = distance

        priceLabel.text = "⭐️ \(rating) (\(data.getReviewCount())) | \(price)"
        phoneLabel.text = data.phone
        if data.phone == "" {
            phoneLabel.text = "-"
        }
        imgPlace.kf.setImage(with: URL(string: data.imageUrl ?? ""))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.phoneLabel.text = nil
        self.priceLabel.text = nil
        self.distanceLabel.text = nil
        self.imgPlace.image = nil
    }
    
}
