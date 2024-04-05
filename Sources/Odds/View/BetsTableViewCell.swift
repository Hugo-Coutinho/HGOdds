//
//  BetsTableViewCell.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation
import UIKit

public class BetsTableViewCell: UITableViewCell {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var sellInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var qualityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    // MARK: - OVERRIDE -
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }

    // MARK: - SETUP -
    public func setup(domain: Odd) {
        nameLabel.text = domain.name
        sellInLabel.text = domain.sellIn
        qualityLabel.text = domain.quality
    }
}

// MARK: - UI -
extension BetsTableViewCell {
    private func setupComponents() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(qualityLabel)
        contentView.addSubview(sellInLabel)
        activateConstraints()
    }

    private func activateConstraints() {
        activateNameConstraints()
        activateQualityConstraints()
        activateSellInConstraints()
    }
    
    private func activateNameConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
    }
    
    private func activateQualityConstraints() {
        NSLayoutConstraint.activate([
            qualityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            qualityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            qualityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
        ])
    }
    
    private func activateSellInConstraints() {
        NSLayoutConstraint.activate([
            sellInLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            sellInLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            sellInLabel.topAnchor.constraint(equalTo: qualityLabel.bottomAnchor, constant: 8),
            sellInLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}


