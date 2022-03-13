//
//  ImageViewController.swift
//  Cassini
//
//  Created by Sergey Lukaschuk on 11.03.2022.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.00
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }

    // MARK: - Private Properties
    private var imageView = UIImageView()

    private var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fitchImage()
            }
        }
    }

    private var image: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fitchImage()
        }
    }

    // Zoom
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }

    // MARK: - Private Methods
    private func fitchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }
}
