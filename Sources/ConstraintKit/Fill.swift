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

	/// Sets `self` to be equal to `view` with insets
	@available(macOS 11.0, *)
	public func fillSystemSpacing(view: View, multipliers: EdgeInsets) -> [NSLayoutConstraint] {
		[
			self.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: multipliers.top),
			self.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: multipliers.left),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: multipliers.right),
			view.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: multipliers.bottom),
		]
	}

	@available(macOS 11.0, *)
	public func fillSystemSpacing(view: View, multiplier: CGFloat = 0) -> [NSLayoutConstraint] {
		self.fillSystemSpacing(view: view, multipliers: EdgeInsets(top: multiplier, left: multiplier, bottom: multiplier, right: multiplier))
	}

	@available(macOS 11.0, *)
	public func fillSuperviewSystemSpacing(multipliers: EdgeInsets) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot fill superview if it is nil")
		return self.fillSystemSpacing(view: self.superview!, multipliers: multipliers)
	}

	@available(macOS 11.0, *)
	public func fillSuperviewSystemSpacing(multiplier: CGFloat = 0) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot fill superview if it is nil")
		return self.fillSystemSpacing(view: self.superview!, multiplier: multiplier)
	}
}
