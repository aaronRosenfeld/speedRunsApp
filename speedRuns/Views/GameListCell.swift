//
//  GameListCell.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GameListCell: UITableViewCell {
    
    var gameName: String? {
        didSet {
            gameNameLabel.text = gameName
        }
    }
    
    var releaseDate: String? {
        didSet {
            guard let releaseDate = releaseDate else {
                releaseDateLabel.isHidden = true
                return
            }
            releaseDateLabel.text = "Released: \(releaseDate)"
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private lazy var gameImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var gameImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var labelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        selectionStyle = .none
        
        labelContainerView.addSubview(gameNameLabel)
        labelContainerView.addSubview(releaseDateLabel)
        detailsView.addSubview(labelContainerView)
        containerView.addSubview(detailsView)
        gameImageContainerView.addSubview(gameImageView)
        containerView.addSubview(gameImageContainerView)
        addSubview(containerView)
        
        gameNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.trailing.equalToSuperview()
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(gameNameLabel)
            make.bottom.equalToSuperview().inset(7)
        }
        
        labelContainerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        detailsView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(labelContainerView)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(225)
        }
        
        gameImageContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(detailsView.snp.top)
        }
        
        gameImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(140)
        }
    }
    
}
