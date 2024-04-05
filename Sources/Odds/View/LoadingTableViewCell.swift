//
//  LoadingTableViewCell.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import UIKit

public class LoadingTableViewCell: UITableViewCell {
    // MARK: - UI ELEMENTS -
    private lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
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
}

// MARK: - UI -
extension LoadingTableViewCell {
    private func setupComponents() {
        contentView.addSubview(spinner)
        activateConstraints()
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            spinner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            spinner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            spinner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            spinner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}


