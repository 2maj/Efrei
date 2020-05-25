cmake_minimum_required(VERSION 3.16)
project(corrections_TP1_part1_tableaux C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(corrections_TP1_part1_tableaux
        gestion_tableaux.c
        gestion_tableaux.h
        test_gestion_tableaux.c my_struct.h gestion_matrice.c gestion_matrice.h)
