//
//  ViewController.swift
//  r01
//
//  Created by sagar on 24/03/25.
//

import UIKit
import InfomaniakRichHTMLEditor

class EditorViewController: UIViewController {
    
    var editor: RichHTMLEditorView!
    var toolbarButtons = [UIView]()
    
    var toolbarCurrentColorPicker: ToolbarAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Infomaniak - RichHTMLEditor (iOS)"
        view.backgroundColor = .systemBackground
        
        setupEditor()
    }

    func setupEditor() {
        createEditor()
    }

    func createEditor() {
        editor = RichHTMLEditorView()
        if let cssURL = Bundle.main.url(forResource: "editor", withExtension: "css"), let css = try? String(contentsOf: cssURL) {
            editor.injectAdditionalCSS(css)
        }
        editor.translatesAutoresizingMaskIntoConstraints = false
        editor.delegate = self
    }
}

