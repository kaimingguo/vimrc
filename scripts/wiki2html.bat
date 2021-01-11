@echo off
:: Copyright 2020 Kaiming Guo. All rights reserved.
:: Use of this source code is governed by a BSD-style license that can be
:: found in the LICENSE file.
setlocal

set PATH=%PATH%;%~dp0

:: Defer control
python "%~dp0\wiki2html.py" %*
