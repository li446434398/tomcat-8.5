@echo off
rem Licensed to the Apache Software Foundation (ASF) under one or more
rem contributor license agreements.  See the NOTICE file distributed with
rem this work for additional information regarding copyright ownership.
rem The ASF licenses this file to You under the Apache License, Version 2.0
rem (the "License"); you may not use this file except in compliance with
rem the License.  You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

rem ---------------------------------------------------------------------------
rem Start script for the CATALINA Server
rem ---------------------------------------------------------------------------
rem 上面都是注释，没啥卵用
setlocal


rem 将当前目录设置到CURRENT_DIR变量中
set "CURRENT_DIR=%cd%"
rem 如果有设置CATALINA_HOME环境变量,跳转到gotHome代码处
if not "%CATALINA_HOME%" == "" goto gotHome
rem 如果没有设置CATALINA_HOME环境变量，将CURRENT_DIR赋值给CATALINA_HOME
set "CATALINA_HOME=%CURRENT_DIR%"
rem 如果存在catalina.bat脚本，跳转到okHome处
if exist "%CATALINA_HOME%\bin\catalina.bat" goto okHome
cd ..
set "CATALINA_HOME=%cd%"
cd "%CURRENT_DIR%"

:gotHome
rem 如果在设置CATALINA_HOME环境变量里面，没有找到catalina.bat报错，有找到跳转okHome
if exist "%CATALINA_HOME%\bin\catalina.bat" goto okHome
echo The CATALINA_HOME environment variable is not defined correctly
echo This environment variable is needed to run this program
goto end

:okHome
set "EXECUTABLE=%CATALINA_HOME%\bin\catalina.bat"
rem 再次判断是否存在catalina.bat,存在跳转okExec,否则输出报错信息
if exist "%EXECUTABLE%" goto okExec
echo Cannot find "%EXECUTABLE%"
echo This file is needed to run this program
goto end

:okExec
rem 将setArgs代码块值，赋值给CMD_LINE_ARGS
set CMD_LINE_ARGS=
:setArgs
if ""%1""=="""" goto doneSetArgs
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setArgs
:doneSetArgs

rem  执行catalina.bat脚本，如果有参数带上参数
call "%EXECUTABLE%" start %CMD_LINE_ARGS%
:end
