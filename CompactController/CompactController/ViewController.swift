//
//  ViewController.swift
//  CompactController
//
//  Created by nastasya on 15.05.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresentButton()
    }
    
    private func setupPresentButton() {
        presentButton.frame = CGRectMake(0, 100, 200, 50)
        presentButton.center.x = view.center.x
        presentButton.setAttributedTitle(NSAttributedString(
            string: "Present",
            attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]),
            for: .normal
        )
        presentButton.setTitleColor(.systemGreen, for: .normal)
        presentButton.addTarget(self, action: #selector(presentCompactController), for: .touchUpInside)
        view.addSubview(presentButton)
    }
    
    @objc func presentCompactController() {
        let compactViewController = CompactViewController()
        compactViewController.modalPresentationStyle = .popover
        compactViewController.preferredContentSize = CGSize(width: 300, height: 280)
        
        guard let compactPopoverPresentationController = compactViewController.popoverPresentationController else { return }
        compactPopoverPresentationController.sourceView = presentButton
        compactPopoverPresentationController.sourceRect = CGRect(
            x: presentButton.bounds.midX,
            y: presentButton.bounds.maxY,
            width: 0,
            height: 0
        )
        compactPopoverPresentationController.delegate = self
        compactPopoverPresentationController.permittedArrowDirections = .up
        
        present(compactViewController, animated: true)
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
}
