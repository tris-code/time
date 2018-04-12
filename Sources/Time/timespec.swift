/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Platform

extension timespec {
    @inline(__always)
    static func now() -> timespec {
        var ts = timespec()
        #if os(macOS) || os(iOS)
        _clock_gettime(&ts)
        #else
        clock_gettime(CLOCK_REALTIME, &ts)
        #endif
        return ts
    }

    #if os(macOS) || os(iOS)
    @inline(__always)
    static func _clock_gettime(_ ts: inout timespec)
    {
        if #available(OSX 10.12, *) {
            clock_gettime(CLOCK_REALTIME, &ts)
        } else {
            var info = mach_timebase_info_data_t()
            if info.numer == 0 || info.denom == 0 {
                mach_timebase_info(&info)
            }
            let time = mach_absolute_time() * UInt64(info.numer / info.denom)
            ts.tv_sec = Int(time / 1_000_000_000)
            ts.tv_nsec = Int(time % 1_000_000_000)
        }
    }
    #endif
}
