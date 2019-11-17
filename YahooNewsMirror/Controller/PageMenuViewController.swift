//
//  PageMenuViewController.swift
//  YahooNewsMirror
//
//  Created by TOUYA KAWANO on 2019/11/17.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PageMenuViewController: ButtonBarPagerTabStripViewController {
    
    // MARK: LifeCycle

    override func viewDidLoad() {
        setButtonBar()
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return createNewsViewController()
    }
    
    // MARK: Private Function

    /// タブメニューのレイアウトを設定します
    /// - Warning: 必ずsuper.viewDidLoad()の上で呼び出してください。
    private func setButtonBar() {
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .yellow
        settings.style.buttonBarMinimumLineSpacing = 2
    }
    
    /// ニュース表示用のViewControllerを生成します。
    private func createNewsViewController() -> [UIViewController] {
        var childViewControllers: [UIViewController] = []
        NewsType.allCases.forEach {
            let itemInfo = IndicatorInfo(title: $0.itemInfo)
            let vc = NewsViewController(newsType: $0,
                                        style: .plain,
                                        itemInfo: itemInfo)
            childViewControllers.append(vc)
        }
        return childViewControllers
    }
}
