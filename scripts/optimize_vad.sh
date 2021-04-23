#!/bin/bash

# Put here the program (maybe with path)
GETF0="get_pitch"

touch results.txt
touch temp.txt
rm results.txt
rm temp.txt

for d in $(seq 0.475 0.475); do
    for p in $(seq 6 6); do
        for r in $(seq 0 0); do
            for fwav in pitch_db/train/*.wav; do
                ff0=${fwav/.wav/.f0}
                echo "$GETF0 $fwav $ff0 -r $r -p $p -d $d"
                $GETF0 $fwav $ff0 -r $r -p $p -d $d > /dev/null || (echo "Error in $GETF0 $fwav $ff0"; exit 1)
            done

            pitch_evaluate pitch_db/train/*.f0ref | tee ~/PAV/P3/temp.txt
            echo "$r $p $d" >> results.txt
            tail -3 temp.txt >> results.txt

        done
    done
done

exit 0