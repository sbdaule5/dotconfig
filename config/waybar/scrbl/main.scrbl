#lang scribble/text

@; Generate JSONC output
// -*- mode: jsonc - generated -*-
[
    @(define outputs '("eDP-1" "HDMI-A-1"))
    @(for/list ([output outputs])
        @list{@(include "bar.scrbl"),}
    )
]
