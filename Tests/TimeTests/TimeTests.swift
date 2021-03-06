import Test
@testable import Time

final class TimeTests: TestCase {
    func testNow() {
        assertEqual(Time().seconds, Time.now.seconds)
        assertTrue(Time() > Time(seconds: 1523558109, nanoseconds: 0))
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

    func testDouble() {
        let duration = Time.Duration(seconds: 123, nanoseconds: 321_000_000)
        let timeInterval = Double(duration)
        assertEqual(timeInterval, 123.321)
        let original = Time.Duration(timeInterval)
        assertEqual(original, duration)
    }

    func testFromString() {
        let time = Time("12/04/18 18:26:32", format: "%d/%m/%y %T")
        assertEqual(time?.seconds, 1523557592)
        assertEqual(time?.nanoseconds, 0)
    }

    func testEquatable() {
        assertEqual(
            Time(seconds: 1, nanoseconds: 2),
            Time(seconds: 1, nanoseconds: 2))

        assertNotEqual(
            Time(seconds: 1, nanoseconds: 2),
            Time(seconds: 1, nanoseconds: 3))
    }
}
