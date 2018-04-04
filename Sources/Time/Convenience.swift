/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

// MARK: DurationConvertible

extension Time: TimeProtocol{}
extension Time.Duration: TimeProtocol{}

public protocol TimeProtocol {
    var seconds: Int { get }
    var nanoseconds: Int { get }

    init(seconds: Int, nanoseconds: Int)
}

extension TimeProtocol {
    public var s: Int {
        return seconds
    }

    public var ms: Int {
        return seconds * 1_000 + nanoseconds / 1_000_000
    }

    public var us: Int {
        return seconds * 1_000_000 + nanoseconds / 1_000
    }

    public var ns: Int {
        return seconds * 1_000_000_000 + nanoseconds
    }
}

extension IntegerLiteralType {
    public var s: Time.Duration {
        return .init(seconds: self, nanoseconds: 0)
    }

    public var ms: Time.Duration {
        return .init(seconds: self / 1_000, nanoseconds: self * 1_000_000)
    }

    public var us: Time.Duration {
        return .init(seconds: self / 1_000_000, nanoseconds: self * 1_000)
    }

    public var ns: Time.Duration {
        return .init(seconds: self / 1_000_000_000, nanoseconds: self)
    }
}

// MARK: Double

extension TimeProtocol {
    @inlinable
    public init(_ double: Double) {
        let seconds = Int(double)
        let ms = Int((double - Double(Int(double))) * 1_000) * 1_000_000
        let nanoseconds = ms * 1_000_000
        self.init(seconds: seconds, nanoseconds: nanoseconds)
    }
}

extension Double {
    @inlinable
    public init(_ interval: Time.Interval) {
        self.init(interval.duration)
    }

    @inlinable
    public init<T: TimeProtocol>(_ time: T) {
        self = Double(time.seconds) +
            Double(time.nanoseconds / 1_000_000) / 1_000
    }
}
