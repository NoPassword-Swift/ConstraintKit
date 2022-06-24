//
//  Fill.swift
//  ConstraintKit
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

extension View {
	/// Sets `self` to be equal to `view` with insets
	public func fill(view: View, insets: EdgeInsets) -> [NSLayoutConstraint] {
		[
			self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
			self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
			view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right),
			view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom),
		]
	}

	public func fill(view: View, inset: CGFloat = 0) -> [NSLayoutConstraint] {
		self.fill(view: view, insets: EdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
	}

	public func fillSuperview(insets: EdgeInsets) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot fill superview if it is nil")
		return self.fill(view: self.superview!, insets: insets)
	}

	public func fillSuperview(inset: CGFloat = 0) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot fill superview if it is nil")
		return self.fill(view: self.superview!, inset: inset)
	}
}
