#!/bin/bash

set -u
set -e

HGBASEDIR=`hg root`
LOGFILE="${HGBASEDIR}/_build/latex.log"

if make latex > $LOGFILE; then
        cd _build/latex
        if make all-pdf >> $LOGFILE; then
                echo "LaTeX build succeeded!"
        else
                echo "LaTeX build failed!"
        fi
else
        echo "Building LaTeX sources failed!"
fi
