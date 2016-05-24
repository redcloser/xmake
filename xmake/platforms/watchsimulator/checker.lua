--!The Automatic Cross-platform Build Tool
-- 
-- XMake is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.
-- 
-- XMake is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public License
-- along with XMake; 
-- If not, see <a href="http://www.gnu.org/licenses/"> http://www.gnu.org/licenses/</a>
-- 
-- Copyright (C) 2015 - 2016, ruki All rights reserved.
--
-- @author      ruki
-- @file        checker.lua
--

-- imports
import("core.tool.tool")
import("platforms.checker", {rootdir = os.programdir()})

-- check the toolchains
function _check_toolchains(config)

    -- done
    checker.check_toolchain(config, "cc",   "xcrun -sdk watchsimulator ", "clang",    "the c compiler") 
    checker.check_toolchain(config, "cxx",  "xcrun -sdk watchsimulator ", "clang",    "the c++ compiler") 
    checker.check_toolchain(config, "cxx",  "xcrun -sdk watchsimulator ", "clang++",  "the c++ compiler") 
    checker.check_toolchain(config, "mm",   "xcrun -sdk watchsimulator ", "clang",    "the objc compiler") 
    checker.check_toolchain(config, "mxx",  "xcrun -sdk watchsimulator ", "clang++",  "the objc++ compiler") 
    checker.check_toolchain(config, "mxx",  "xcrun -sdk watchsimulator ", "clang",    "the objc++ compiler") 
    checker.check_toolchain(config, "as",   "xcrun -sdk watchsimulator ", "clang",     "the assember") 
    checker.check_toolchain(config, "ld",   "xcrun -sdk watchsimulator ", "clang++",  "the linker") 
    checker.check_toolchain(config, "ld",   "xcrun -sdk watchsimulator ", "clang",    "the linker") 
    checker.check_toolchain(config, "ar",   "xcrun -sdk watchsimulator ", "ar",       "the static library linker") 
    checker.check_toolchain(config, "sh",   "xcrun -sdk watchsimulator ", "clang++",  "the shared library linker") 
    checker.check_toolchain(config, "sh",   "xcrun -sdk watchsimulator ", "clang",    "the shared library linker") 
    checker.check_toolchain(config, "sc",   "xcrun -sdk watchsimulator ", "swiftc",   "the swift compiler") 
    checker.check_toolchain(config, "lipo", "xcrun -sdk watchsimulator ", "lipo",     "the universal files creater") 
end

-- init it
function init()

    -- init the check list of config
    _g.config = 
    {
        { checker.check_arch, "i386" }
    ,   checker.check_xcode
    ,   checker.check_xcode_sdkver
    ,   checker.check_target_minver
    ,   checker.check_ccache
    ,   _check_toolchains
    }

    -- init the check list of global
    _g.global = 
    {
        checker.check_xcode
    ,   checker.check_ccache
    }

end

-- get the property
function get(name)

    -- get it
    return _g[name]
end

