//
//  Types.swift
//  ConstraintKit
//

#if os(iOS)
import UIKit
public typealias View = UIView
public typealias EdgeInsets = UIEdgeInsets
public typealias LayoutPriority = UILayoutPriority
#endif

#if os(macOS)
import AppKit
public typealias View = NSView
public typealias EdgeInsets = NSEdgeInsets
public typealias LayoutPriority = NSLayoutConstraint.Priority
#endif
