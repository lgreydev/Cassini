//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Sergey Lukaschuk on 15.03.2022.
//

import UIKit

class CassiniViewController: UIViewController {

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                if let imageVC = segue.destination.contents as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.titleLabel?.text
                }
            }
        }
    }
}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
//        } else if let tabcon = self as? UITabBarController {
//            return tabcon.selectedViewController ?? self
        } else {
            return self
        }
    }
}
