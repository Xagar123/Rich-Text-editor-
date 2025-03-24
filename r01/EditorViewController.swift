//
//  ViewController.swift
//  r01
//
//  Created by sagar on 24/03/25.
//

import UIKit
import InfomaniakRichHTMLEditor
import Down

class EditorViewController: UIViewController {
    
    var editor: RichHTMLEditorView!
    var toolbarButtons = [UIView]()
    
    var toolbarCurrentColorPicker: ToolbarAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Infomaniak - RichHTMLEditor (iOS)"
        view.backgroundColor = .systemBackground
        
        setupEditor()
        setupToolbar()
       
        let markdown = "**Hello, World!** This is a test."
        do {
            let html = try Down(markdownString: markdown).toHTML()
            print(html)  // Outputs: <p><strong>Hello, World!</strong> This is a test.</p>
            editor.html = html
        } catch {
            print("Conversion failed: \(error)")
        }
        
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

