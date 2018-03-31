/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
@testable import Time

final class TimeTests: TestCase {
    func testNow() {
        assertEqual(Time(), .now)
    }

    func testDuration() {
        let duration: Time.Duration = 5.s
        let time: Time = .now

        let future = time + duration
        assertEqual(future.nanoseconds, time.nanoseconds)
        assertEqual(future.seconds, time.seconds + 5)
    }

    func testInterval() {
        let location1: Time = .now
        let location2: Time = location1 + 2.s

        let interval = Time.Interval(location1, location2)
        assertEqual(interval.location, location1)
        assertEqual(interval.duration, 2.s)

        let interval1 = location1.interval(location2)
        assertEqual(interval1, interval)

        let interval2 = location2.interval(location1)
        assertEqual(interval2, interval)
    }

    func testDescription() {
        let seconds = Time(seconds: 123, nanoseconds: 123_000_000)
        assertEqual(seconds.description, "123.123 sec")

        let milliseconds = Time(seconds: 0, nanoseconds: 123_000_000)
        assertEqual(milliseconds.description, "123 ms")

        let microseconds = Time(seconds: 0, nanoseconds: 123_000)
        assertEqual(microseconds.description, "123 μs")

        let nanoseconds = Time(seconds: 0, nanoseconds: 123)
        assertEqual(nanoseconds.description, "123 ns")
    }
}
