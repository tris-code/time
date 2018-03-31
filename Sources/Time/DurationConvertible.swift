/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension Time: DurationConvertible{}
extension Time.Duration: DurationConvertible{}

protocol DurationConvertible {
    var seconds: Int { get }
    var nanoseconds: Int { get }
}

extension DurationConvertible {
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
