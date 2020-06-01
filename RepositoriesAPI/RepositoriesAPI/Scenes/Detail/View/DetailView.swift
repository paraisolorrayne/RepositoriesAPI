//
//  DetailView.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 01/06/20.
//

import UIKit

class DetailView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    fileprivate func renderReadme(base64String: String) {
//        let decodedData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)!
//        let decodedString = String(data: decodedData, encoding: .utf8)!
//        let markDownView = MarkdownView()
//        markDownView.frame = view.frame
//        view.addSubview(markDownView)
//        markDownView.load(markdown: decodedString)
//        // called when user touch link
//        markDownView.onTouchLink = { [weak self] request in
//            guard let url = request.url else { return false }
//
//            if url.scheme == "file" {
//                return false
//            } else if url.scheme == "https" {
//                let safari = SFSafariViewController(url: url)
//                self?.navigationController?.pushViewController(safari, animated: true)
//                return false
//            } else {
//                return false
//            }
//        }
    }

}
