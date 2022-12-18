#!/bin/bash

function run_the_thing {
    (
        set -e
        rm -f build/* 
        mkdir -p build 
        cd build
        # array=( "${SOURCES[@]/#/${DIR}/}" )
        array=( "${SOURCES[@]/#/../}" )
        ghdl -a "${array[@]}"
        ghdl -r $TARGET --wave=wave.ghw
    )
}

function doit {
    echo $1
    case $1 in
        johnson_counter)
            DIR=$PWD
            SOURCES=("upcounter.vhdl" "decoder_1ofN.vhdl" "johnson_counter.vhdl" "johnson_counter.tb.vhdl")
            TARGET=TB_$1
            run_the_thing
            ;;
        core)
            DIR=$PWD
            SOURCES=( "upcounter.vhdl" \
                          "decoder_1ofN.vhdl" \
                          "johnson_counter.vhdl" \
                          "tinyrom.vhdl" \
                          "register.vhdl" \
                          "register_tristate.vhdl" \
                          "instruction_decoder.vhdl" \
                          "gate_or.vhdl" \
                          "instruction_cycle_generator.vhdl" \
                          "step_decoder.vhdl" \
                          "core.vhdl" \
                          "core.tb.vhdl")
            TARGET=TB_$1
            run_the_thing
            ;;
        instruction_decoder)
            DIR=$PWD
            SOURCES=("decoder_1ofN.vhdl" "register.vhdl" "upcounter.vhdl" "instruction_decoder.vhdl" "instruction_decoder.tb.vhdl")
            TARGET=TB_$1
            run_the_thing
            ;;
        adder)
            DIR=$PWD
            SOURCES=("adder.vhdl" "adder.tb.vhdl")
            TARGET=adder_tb
            run_the_thing
            ;;
        decoder_1ofN)
            DIR=$PWD
            SOURCES=("decoder_1ofN.vhdl" "decoder_1ofN.tb.vhdl")
            TARGET=TB_decoder_one_of_many
            run_the_thing
            ;;
        register)
            DIR=$PWD
            SOURCES=("register.vhdl" "register.tb.vhdl")
            TARGET=TB_register
            run_the_thing
            ;;
        register_tristate)
            DIR=$PWD
            SOURCES=("register_tristate.vhdl" "register_tristate.tb.vhdl")
            TARGET=TB_register_tristate
            run_the_thing
            ;;
        tinyrom)
            DIR=$PWD
            SOURCES=("tinyrom.vhdl" "tinyrom.tb.vhdl")
            TARGET=TB_tinyrom
            run_the_thing
            ;;
        gate_or)
            DIR=$PWD
            SOURCES=("gate_or.vhdl" "gate_or.tb.vhdl")
            TARGET=TB_gate_or
            run_the_thing
            ;;
        instruction_cycle_generator)
            DIR=$PWD
            SOURCES=("upcounter.vhdl" "instruction_cycle_generator.vhdl" "instruction_cycle_generator.tb.vhdl")
            TARGET=TB_instruction_cycle_generator
            run_the_thing
            ;;
        step_decoder)
            DIR=$PWD
            SOURCES=("step_decoder.vhdl" "step_decoder.tb.vhdl")
            TARGET=TB_step_decoder
            run_the_thing
            ;;
        alu)
            DIR=$PWD
            SOURCES=("register.vhdl" "register_tristate.vhdl" "alu.vhdl" "alu.tb.vhdl")
            TARGET=TB_alu
            run_the_thing
            ;;

        all)
            doit alu
            doit adder
            doit instruction_decoder
            doit core
            doit decoder_1ofN
            doit gate_or
            doit instruction_cycle_generator
            doit johnson_counter
            doit register
            doit register_tristate
            doit step_decoder
            doit tinyrom
            
            ;;
    esac
}



doit $1
