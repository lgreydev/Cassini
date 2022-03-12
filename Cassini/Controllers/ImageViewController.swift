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

    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
//            imageURL =
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fitchImage()
        }
    }

    private func fitchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
}
