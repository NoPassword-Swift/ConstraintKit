//
//  Array+Activate.swift
//  ConstraintKit
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

extension Array where Element == NSLayoutConstraint {
	public func activate() {
		NSLayoutConstraint.activate(self)
	}

	public func deactivate() {
		NSLayoutConstraint.deactivate(self)
	}
}
