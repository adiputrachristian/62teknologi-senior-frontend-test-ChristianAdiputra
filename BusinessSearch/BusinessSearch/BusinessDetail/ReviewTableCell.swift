//
//  ReviewTableCell.swift
//  BusinessSearch
//
//  Created by Christian Adiputra on 19/05/23.
//

import Foundation
import DesignKit
import NetworkKit
import Kingfisher

class ReviewTableCell: UITableViewCell {
    
    var img: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Baker Street"
        return label
    }()
    
    var ratingLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.backgroundColor = .lightGray
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.text = "-"
        label.setPadding(left: 8, right: 8, top: 6, bottom: 6)
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()

    var txtLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "-"
        label.numberOfLines = 0
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
        addSubview(img)
        addSubview(ratingLabel)
        addSubview(txtLabel)
        
        img.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right).offset(16)
            make.top.equalTo(img.snp.top)
        }
        
        txtLabel.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(txtLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-16)
        }
    
    }
    
    func updateView(data: Review) {
        let rating = data.getRating()
        txtLabel.text = data.text
        nameLabel.text = data.user?.name
        ratingLabel.text = "⭐️ \(rating)"

        img.kf.setImage(with: URL(string: data.user?.imageUrl ?? ""))
    }
    
}
