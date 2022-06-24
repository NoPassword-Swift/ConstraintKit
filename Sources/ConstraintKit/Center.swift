//
//  Center.swift
//  ConstraintKit
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

extension View {
	/// Sets the center of `self` to be equal to the center of `view`
	public func center(in view: View) -> [NSLayoutConstraint] {
		[
			self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		]
	}

	public func centerInSuperview() -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot center in superview if it is nil")
		return self.center(in: self.superview!)
	}
}

extension View {
	/// Sets the center of `self` to be equal to the center of `view`
	/// Sets the width and height of `self` to be a fraction of the width and height of `view`
	public func center(in view: View, fractions: (x: CGFloat, y: CGFloat)) -> [NSLayoutConstraint] {
		[
			self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: fractions.x),
			self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: fractions.y),
		]
	}

	public func center(in view: View, fraction: CGFloat) -> [NSLayoutConstraint] {
		self.center(in: view, fractions: (fraction, fraction))
	}

	public func centerInSuperview(fractions: (x: CGFloat, y: CGFloat)) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot center in superview if it is nil")
		return self.center(in: self.superview!, fractions: fractions)
	}

	public func centerInSuperview(fraction: CGFloat) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot center in superview if it is nil")
		return self.center(in: self.superview!, fraction: fraction)
	}
}

extension View {
	/// Sets the center of `self` to be equal to the center of `view`
	/// Sets the width and height of `self` to be less than or equal to the width and height of `view` with insets
	public func centerResistingCompression(in view: View, insets: EdgeInsets) -> [NSLayoutConstraint] {
		[
			self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			self.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).with(priority: .defaultLow),
			self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).with(priority: .defaultLow),
			view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right).with(priority: .defaultLow),
			view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom).with(priority: .defaultLow),

			self.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: insets.top),
			self.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: insets.left),
			view.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: insets.right),
			view.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: insets.bottom),
		]
	}

	public func centerResistingCompression(in view: View, inset: CGFloat = 0) -> [NSLayoutConstraint] {
		self.centerResistingCompression(in: view, insets: EdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
	}

	public func centerResistingCompressionInSuperview(insets: EdgeInsets) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot center in superview if it is nil")
		return self.centerResistingCompression(in: self.superview!, insets: insets)
	}

	public func centerResistingCompressionInSuperview(inset: CGFloat = 0) -> [NSLayoutConstraint] {
		precondition(self.superview != nil, "Cannot center in superview if it is nil")
		return self.centerResistingCompression(in: self.superview!, inset: inset)
	}
}
