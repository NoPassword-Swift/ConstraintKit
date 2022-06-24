//
//  NSLayoutConstraint+With.swift
//  ConstraintKit
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

extension NSLayoutConstraint {
	public func with(priority: LayoutPriority) -> Self {
		self.priority = priority
		return self
	}
}
