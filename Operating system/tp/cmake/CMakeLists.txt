cmake_minimum_required(VERSION 3.16)
project(cmake C)

set(CMAKE_C_STANDARD 99)

add_executable(cmake main.c gestion_tableaux.h gestion_tableaux.c)