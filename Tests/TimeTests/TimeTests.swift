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
}
