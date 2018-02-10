//
//  Button.swift
//  Controls With Closures
//
//  Created by Bart Jacobs on 06/08/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class Button: UIButton {

    typealias DidTapButton = (Button) -> ()

    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: #selector(didTouchUpInsideFunc(_:)), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(didTouchUpInsideFunc(_:)), for: .touchUpInside)
            }
        }
    }

    // MARK: - Actions

    func didTouchUpInsideFunc(_ sender: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }
    
}
