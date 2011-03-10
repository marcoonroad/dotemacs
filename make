#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re

from glob       import glob
from subprocess import Popen, PIPE, call

can_build = True


#### HELPERS ################################################################
def fatal(msg):
    global can_build
    can_build = False
    print "\033[0;35m%s\t[FAILED]\033[0m" % (msg,)


def warn(msg):
    print "\033[0;33m%s\t[FAILED]\033[0m" % (msg,)


def success(msg):
    print "\033[0;32m%s\t[OK]\033[0m" % (msg,)


def info(msg):
    print "\n\033[0;36m» %s\033[0m" % (msg,)


def run(cmd):
    proc = Popen(cmd, stdout=PIPE)
    return proc.communicate()[0].strip()


def get_version(prog):
    output = run([prog, "--version"])
    return re.search(r"(\d+\.\d+(?:\.\d+)?)", output).group(1)


def version(s):
    n = 0
    s = s.split(".")
    if len(s) < 3:
        s.append('0')

    for index, component in enumerate(s[::-1]):
        n += 100 ** index * int(component)

    return n


def display(msg, check, required):
    if check:
        success(msg)
    elif required:
        fatal(msg)
    else:
        warn(msg)


def emacs_load(elfile):
    return ["emacs", "--batch", "-l", elfile]


def check_dep(prog, ver, required=True):
    prog_ver = get_version(prog)
    message  = "%s v%s" % (prog, ver)
    dep_ok   = version(prog_ver) >= version(ver)

    display(message, dep_ok, required)


def check_run(cmd, msg, required=True):
    fnull  = open(os.devnull, 'w')
    proc   = Popen(cmd, stdout=fnull, stderr=fnull)
    failed = proc.wait()

    display(msg, not failed, required)


def byte_compile(*dirs):
    def cc():
        return ["emacs", "--batch"
               ,"-f", "batch-byte-compile"] + glob("%s/*.el" % (folder))

    for folder in dirs:
        check_run(cc(), "Processing %s" % (folder,), False)
        
        


#############################################################################
# Runs the stuff

info("Checking dependencies...")
check_dep('emacs',  '23.0.0')
check_dep('git',    '1.7.0')
check_dep('svn',    '1.6.0')
check_dep('make',   '3.0.0')

check_dep('node',   '0.4.2', False)
check_dep('coffee', '1.0.0', False)

check_run(emacs_load('color-theme'), 'color-theme')


# If any required dependency failed, screw off
if not can_build:
    print "\n\n\033[0;35mError: Dependency check failed, can't build.\033[0m"
    exit(-1)

# Otherwise, just build the stuff
info("Byte compiling EVERYTHING")
byte_compile("sorella"
            ,"vendor/ahg"
            ,"vendor/anything"
            ,"vendor/coffee-mode"
            ,"vendor/jade-mode"
            ,"vendor/markdown-mode"
            ,"vendor/renpy"
            ,"vendor/tumble"
            ,"vendor/twmode"
            ,"vendor/whitespace")

info("Building some larger mode packages")
check_run(["emacs", "--batch", "-l", "vendor/js2-mode/js2-build.el"
          ,"-f", "js2-build-js2-mode"], "Building js2-mode")

check_run(["make", "-C", "vendor/pymacs"], "Building Pymacs")
