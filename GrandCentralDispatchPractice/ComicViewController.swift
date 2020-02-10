//
//  ViewController.swift
//  GrandCentralDispatchPractice
//
//  Created by Benjamin Stone on 2/10/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var altTextLabel: UILabel!
    @IBOutlet var comicImageView: UIImageView!
    @IBOutlet var loadRandomComicButton: UIButton!
    
    var comic: xkcdComic? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRandomComic(loadRandomComicButton)
    }
    
    func updateUI() {
        titleLabel.text = comic?.title
        altTextLabel.text = comic?.alt
        if let comic = comic,
           let url = URL(string: comic.img) {
            comicImageView.image = try? UIImage(data: Data(contentsOf: url))
        }
    }

    @IBAction func loadRandomComic(_ sender: UIButton) {
        let randomComicNum = Int.random(in: 0...xkcdComic.maxComicNum)
        let urlStr = "https://xkcd.com/\(randomComicNum)/info.0.json"
        guard let url = URL(string: urlStr) else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            let comic = try JSONDecoder().decode(xkcdComic.self, from: jsonData)
            self.comic = comic
        } catch {
            print(error)
        }
    }
}

