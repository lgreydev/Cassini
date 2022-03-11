//
//  ImageViewController.swift
//  Cassini
//
//  Created by Sergey Lukaschuk on 11.03.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fitchImage()
            }
        }
    }

    private func fitchImage() {

    }
}
