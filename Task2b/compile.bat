@echo off
masm /Zi programm,,,;;
masm /Zi F0,,,;;
masm /Zi F1,,,;;
masm /Zi F2,,,;;
masm /Zi F3,,,;;
masm /Zi F4,,,;;
masm /Zi F5,,,;;
masm /Zi F6,,,;;
masm /Zi F7,,,;;
masm /Zi F8,,,;;
masm /Zi M_INPUT,,,;;
masm /Zi NEW_LINE,,,;;
link /CO programm F0 F1 F2 F3 F4 F5 F6 F7 F8 M_INPUT NEW_LINE,,;;

PAUSE