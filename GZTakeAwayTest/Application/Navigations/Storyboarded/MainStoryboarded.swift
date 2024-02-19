//
//  MainStoryboarded.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

protocol MainStoryboarded: BaseStoryboarded {
}

extension MainStoryboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: StoryboardNames.main.rawValue, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
