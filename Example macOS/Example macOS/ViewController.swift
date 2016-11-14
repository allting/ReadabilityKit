//
//  ViewController.swift
//  ReadabilityKit
//
//  Copyright (c) 2016 Exyte http://www.exyte.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Cocoa
import ReadabilityKit

class ViewController: NSViewController {

	@IBOutlet var urlField: NSTextField?
	@IBOutlet var resultView: NSTextView?

	@IBAction func onGo(_ sender: NSControl) {
		resultView?.string = ""

		guard let urlStr = urlField?.stringValue else {
			return
		}

		guard let url = URL(string: urlStr) else {
			return
		}

        Readability.parse(url: url) { data in
            print( "title:\(data?.title)")
            print( "desc:\(data?.description)")
            print( "keywords:\(data?.keywords)")
            
            let title = data?.title ?? "Not found"
            let desc = data?.description ?? "Not found"
            let imageUrl = data?.topImage ?? "Not found"
            let videoUrl = data?.topVideo ?? "Not found"
            let text = data?.text
            
            self.resultView?.string = "TITLE: \(title)\nDESC:\(desc)\nIMAGE:\(imageUrl)\nVIDEO:\(videoUrl)\n\n\n\(text)"
        }
	}
}

