//
//  BlurView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI
import UIKit
struct BlurView<Content: View>: UIViewRepresentable {
    var style: UIBlurEffect.Style
    var alpha: CGFloat
    let content: Content

    init(style: UIBlurEffect.Style, alpha: CGFloat = 1.0, @ViewBuilder content: () -> Content) {
        self.style = style
        self.alpha = alpha
        self.content = content()
    }

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = alpha

        let hostingController = UIHostingController(rootView: content)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        blurView.contentView.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: blurView.contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor),
        ])

        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
        uiView.alpha = alpha
        (uiView.contentView.subviews.first as? UIHostingController<Content>)?.rootView = content
    }
}
