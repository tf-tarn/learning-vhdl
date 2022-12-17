#!/bin/bash

function run_the_thing {
    (
        set -e
        rm -f build/* 
        mkdir -p build 
        cd build
        # array=( "${SOURCES[@]/#/${DIR}/}" )
        array=( "${SOURCES[@]/#/../}" )
        echo ${array[@]}
        ghdl -a "${array[@]}"
        ls -l 
        ghdl -r $TARGET --wave=wave.ghw
    )
}

case $1 in
    johnson_counter)
        DIR=$PWD
        SOURCES=("upcounter.vhdl" "decoder_1ofN.vhdl" "johnson_counter.vhdl" "johnson_counter.tb.vhdl")
        TARGET=TB_$1
        run_the_thing
        ;;
    core)
        DIR=$PWD
        SOURCES=("upcounter.vhdl" "decoder_1ofN.vhdl" "johnson_counter.vhdl" "tinyrom.vhdl" "register.vhdl" "core.vhdl" "core.tb.vhdl")
        TARGET=TB_$1
        run_the_thing
        ;;
    control)
        DIR=$PWD
        SOURCES=("decoder_1ofN.vhdl" "register.vhdl" "control.vhdl")
        TARGET=TB_$1
        run_the_thing
        ;;
    adder)
        DIR=$PWD
        SOURCES=("adder.vhdl" "adder.tb.vhdl")
        TARGET=adder_tb
        run_the_thing
        ;;
esac
