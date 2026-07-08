{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.kanata = {
    services.udev.extraRules = ''
      SUBSYSTEM=="input", \
      ENV{ID_BUS}=="i8042", \
      ENV{ID_INPUT_POINTINGSTICK}=="1", \
      ENV{POINTINGSTICK_SENSITIVITY}=="200", \
      SYMLINK+="input/trackpoint-stable"
    '';
    services.libinput = {
      enable = true;
      mouse = {
        dev = "/dev/input/trackpoint-stable";
        accelSpeed = "0.5";
      };
    };
    services.kanata = {
      enable = true;
      keyboards.thinkpad = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/trackpoint-stable"
        ];
        extraDefCfg = ''
          process-unmapped-keys yes

          linux-use-trackpoint-property yes
          mouse-movement-key mvmt

          concurrent-tap-hold yes
          rapid-event-delay 5
        '';
        config = ''
          ;; If you are looking for other keys, the file src/keys/mod.rs
          ;; should hopefully provide some insight.
          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  home end  ins  del
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            wkup lctl lmet lalt      spc            ralt prnt rctl pgup up   pgdn
            mvmt                                                   left down rght
          )

          #|
          (deflayer name
            _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _         _              _    _    _    _    _    _
            _                                                      _    _    _
          )
          |#

          (deflayer base
            caps _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            @cap @a   @s   @d   @f   _    _    @j   @k   @l   @;   _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            @wkf _    lalt lmet      @spm           @ly  _    _    _    _    _
            @tp                                                    _    _    _
          )

          (deflayer typing
            _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    a    s    d    f    _    _    j    k    l    ;    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _         spc            _    _    _    _    _    _
            _                                                      _    _    _
          )

          (deflayer function
            _    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _         _              _    _    _    _    _    _
            _                                                      _    _    _
          )

          (deflayer trackpoint
            @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_
            @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_
            @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_
            @_   @tpa @tps @tpd @tpf @_   @_   mlft mrgt @_   mmid @_   @_
            @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_   @_
            @_   @_   @_   @_        mmid           @_   @_   @_   @_   @_   @_
            @tp                                                    @_   @_   @_
          )

          (deflayer gaming
            _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            esc  a    s    d    f    _    _    mlft mrgt l    ;    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _         _              @ly  _    _    _    _    _
            _                                                      _    _    _
          )

          (deflayer layers
            _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    @1   @2   _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _         _              _    _    _    _    _    _
            _                                                      _    _    _
          )

          (defvirtualkeys
            to-base (layer-switch base)
            hold-tp (layer-while-held trackpoint)
          )

          (defalias
            ;; layer aliases
            fn  (layer-toggle function)
            ly  (layer-toggle layers)
            1   (layer-switch base)
            2   (layer-switch gaming)

            ;; useful capslock
            cap (tap-hold-release 200 200 esc lctl)

            ;; enable function keys
            wkf (tap-hold-release 200 200 wkup @fn)

            ;; this alias allows smooth typing by going to a safe layer once
            ;; any tap-hold on qwerty keys is tapped
            tap (multi
              (layer-switch typing)
              (on-idle 75 tap-virtualkey to-base)
            )

            ;; homerow mods
            a (tap-hold-release 200 200 (multi a @tap) lalt)
            s (tap-hold-release 200 170 (multi s @tap) lsft)
            d (tap-hold-release 200 170 (multi d @tap) lmet)
            f (tap-hold-release 200 150 (multi f @tap) lctl)
            j (tap-hold-release 200 150 (multi j @tap) rctl)
            k (tap-hold-release 200 170 (multi k @tap) rmet)
            l (tap-hold-release 200 170 (multi l @tap) rsft)
            ; (tap-hold-release 200 200 (multi ; @tap) ralt)

            ;; auto mouse-keys layer (on trackpoint movement)
            tp (hold-for-duration 750 hold-tp)
            tpoff (on-press release-vkey hold-tp)
            _ (multi @tpoff _)

            ;; mouse layer homerow mods
            tpa (tap-hold 200 200 (multi a @tpoff @tap) lalt)
            tps (tap-hold 200 170 (multi s @tpoff @tap) lsft)
            tpd (tap-hold 200 170 (multi d @tpoff @tap) lmet)
            tpf (tap-hold 200 150 (multi f @tpoff @tap) lctl)

            ;; ergonomic scrolling
            spm (tap-hold 200 200 spc mmid)
          )
        '';
      };
    };
  };
}
