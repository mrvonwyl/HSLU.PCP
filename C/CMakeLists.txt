cmake_minimum_required(VERSION 3.8)
project(PCP)

set(CMAKE_C_STANDARD 11)

set(SOURCE_FILES main.c stack.c)
add_executable(PCP ${SOURCE_FILES})