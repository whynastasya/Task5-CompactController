//
//  CompactViewController.swift
//  CompactController
//
//  Created by nastasya on 15.05.2023.
//

import UIKit

final class CompactViewController: UIViewController {

    private let closeButton = UIButton()
    private let sizesSegmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupCloseButton()
        setupSizesSegmentedController()
    }

    private func setupCloseButton() {
        closeButton.frame = CGRect(x: 250, y: 30, width: 35, height: 35)
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
        closeButton.setImage(UIImage(systemName: "xmark")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        closeButton.backgroundColor = .lightGray.withAlphaComponent(0.4)
        closeButton.addTarget(self, action: #selector(dismissCompactContoller), for: .touchUpInside)
        view.addSubview(closeButton)
    }

    @objc func dismissCompactContoller() {
        dismiss(animated: true)
    }
    
    private func setupSizesSegmentedController() {
        sizesSegmentedControl.frame = CGRect(x: 60, y: 30, width: 180, height: 30)
        sizesSegmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: true)
        sizesSegmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: true)
        sizesSegmentedControl.selectedSegmentIndex = 0
        sizesSegmentedControl.addTarget(self, action: #selector(changeSizeCompactController), for: .valueChanged)
        view.addSubview(sizesSegmentedControl)
    }
    
    @objc func changeSizeCompactController(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 1 {
            self.preferredContentSize = CGSize(width: 300, height: 150)
        } else {
            self.preferredContentSize = CGSize(width: 300, height: 280)
        }
    }
}
