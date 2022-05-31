use v6.c;

use NativeCall;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Synth;

class FluidSynth::Synth {
  has fluid_synth_t $!fs is implementor;

  submethod BUILD ( :$fluid-synth ) {
    $!fs = $fluid-synth;
  }

  method FluidSynth::Raw::Definitions::fluid_synth_t
  { $!fs }

  proto method new (|)
  { * }

  multi method new (fluid_synth_t $fluid-synth) {
    $fluid-synth ?? self.bless( :$fluid-synth ) !! Nil;
  }
  multi method new (fluid_settings_t() $settings) {
    self.new_fluid_synth($settings);
  }

  method new_fluid_synth (fluid_settings_t $settings) {
    my $fluid-synth = new_fluid_synth($settings);

    $fluid-synth ?? self.bless( :$fluid-synth ) !! Nil;
  }

  proto method activate_key_tuning (|)
  { * }

  multi method activate_key_tuning (
    Int()           $bank,
    Int()           $prog,
    Str()           $name,
                    @pitch,
    Int()           $apply
  ) {
    die 'Invalid @pitch length! Must be 128!' unless @pitch.elems == 128;

    samewith(
      $bank,
      $prog,
      $name,
      ArrayToCArray(gdouble, @pitch),
      $apply
    );
  }
  multi method activate_key_tuning (
    Int()           $bank,
    Int()           $prog,
    Str()           $name,
    CArray[gdouble] $pitch,
    Int()           $apply
  ) {
    my gint ($b, $p, $a) = ($bank, $prog, $apply);

    fluid_synth_activate_key_tuning($!fs, $b, $p, $name, $p, $a);
  }

  method activate_octave_tuning (
    Int()           $bank,
    Int()           $prog,
    Str()           $name,
    CArray[gdouble] $pitch,
    Int()           $apply
  ) {
    my gint ($b, $p, $a) = ($bank, $prog, $apply);

    fluid_synth_activate_octave_tuning($!fs, $b, $p, $name, $p, $a);
  }

  method activate_tuning (
    Int() $chan,
    Int() $bank,
    Int() $prog,
    Int() $apply
  ) {
    my gint ($c, $b, $p, $a) = ($chan, $bank, $prog, $apply);

    fluid_synth_activate_tuning($!fs, $c, $b, $p, $a);
  }

  method add_default_mod (fluid_mod_t() $mod, Int() $mode) {
    my gint $m = $mode;

    fluid_synth_add_default_mod($!fs, $mod, $m);
  }

  method add_sfloader (fluid_sfloader_t() $loader) {
    fluid_synth_add_sfloader($!fs, $loader);
  }

  method add_sfont (fluid_sfont_t() $sfont) {
    fluid_synth_add_sfont($!fs, $sfont);
  }

  method all_notes_off (Int() $chan) {
    my gint $c = $chan;

    fluid_synth_all_notes_off($!fs, $chan);
  }

  method all_sounds_off (Int() $chan) {
    my gint $c = $chan;

    fluid_synth_all_sounds_off($!fs, $chan);
  }

  method alloc_voice (
    fluid_sample_t()  $sample,
    Int()             $channum,
    Int()             $key,
    Int()             $vel,
                     :$raw       = False
  ) {
    my gint ($c, $k, $v) = ($channum, $key, $vel);

    propReturnObject(
      fluid_synth_alloc_voice($!fs, $sample, $c, $k, $v),
      $raw,
      |FluidSynth::Voice.getTypePair
    );
  }

  method bank_select (Int() $chan, Int() $bank) {
    my gint $c = $chan;

    fluid_synth_bank_select($!fs, $chan, $bank);
  }

  method cc (Int() $chan, Int() $ctrl, Int() $val) {
    my gint ($c, $cc, $v) = ($chan, $ctrl, $val);

    fluid_synth_cc($!fs, $c, $cc, $v);
  }

  method channel_pressure (Int() $chan, Int() $val) {
    my gint ($c, $v) = ($chan, $val);

    fluid_synth_channel_pressure($!fs, $c, $v);
  }

  method chorus_on (Int() $fx_group, Int() $on) {
    my gint ($f, $o) = ($fx_group, $on);

    fluid_synth_chorus_on($!fs, $f, $o);
  }

  method count_audio_channels {
    fluid_synth_count_audio_channels($!fs);
  }

  method count_audio_groups {
    fluid_synth_count_audio_groups($!fs);
  }

  method count_effects_channels {
    fluid_synth_count_effects_channels($!fs);
  }

  method count_effects_groups {
    fluid_synth_count_effects_groups($!fs);
  }

  method count_midi_channels {
    fluid_synth_count_midi_channels($!fs);
  }

  method deactivate_tuning (Int() $chan, Int() $apply) {
    my gint ($c, $a) = ($chan, $apply);

    fluid_synth_deactivate_tuning($!fs, $c, $a);
  }

  method delete_fluid_synth {
    delete_fluid_synth($!fs);
  }

  method cleanup {
    self.delete_fluid_synth;
  }

  method error {
    fluid_synth_error($!fs);
  }

  method get_active_voice_count {
    fluid_synth_get_active_voice_count($!fs);
  }

  method get_bank_offset (Int() $sfont_id) {
    my gint $s = $sfont_id;

    fluid_synth_get_bank_offset($!fs, $s);
  }

  proto method get_basic_channel (|)
  { * }

  multi method get_basic_channel (Int() $chan) {
    samewith($chan, $, $, $);
  }
  multi method get_basic_channel (
    Int() $chan,
          $basic_chan_out is rw,
          $mode_chan_out  is rw,
          $basic_val_out  is rw
  ) {
    my gint  $c            = $chan;
    my gint ($bc, $m, $bv) = 0 xx 3;

    my $rv = fluid_synth_get_basic_channel($!fs, $chan, $bc, $m, $bv);
    ($basic_chan_out, $mode_chan_out, $basic_val_out) = ($bc, $m, $bv);
    $rv.not ?? ($basic_chan_out, $mode_chan_out, $basic_val_out) !! Nil;
  }

  proto method get_breath_mode (|)
  { * }

  multi method get_breath_mode (Int() $chan) {
    samewith($chan, $);
  }
  multi method get_breath_mode (Int() $chan, $breathmode is rw) {
    my gint ($c, $b) = ($chan, 0);

    my $rv = fluid_synth_get_breath_mode($!fs, $chan, $b);
    $breathmode = $b;
    $rv.not ?? $breathmode !! Nil;
  }

  proto method get_cc (|)
  { * }

  multi method get_cc (Int() $chan, Int() $ctrl) {
    samewith($chan, $ctrl, $);
  }
  multi method get_cc (Int() $chan, Int() $ctrl, $pval is rw) {
    my gint ($ch, $ct, $p) = ($chan, $ctrl, 0);

    my $rv = fluid_synth_get_cc($!fs, $chan, $ctrl, $p);
    $pval = $p;
    $rv.not ?? $pval !! Nil;
  }

  method get_channel_preset (Int() $chan) {
    my gint $c = $chan;

    fluid_synth_get_channel_preset($!fs, $c);
  }

  method get_chorus_depth
    is DEPRECATED<get_chorus_group_depth>
  {
    fluid_synth_get_chorus_depth($!fs);
  }

  proto method get_chorus_group_depth (|)
  { * }

  multi method get_chorus_group_depth (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_chorus_group_depth (Int() $fx_group, $depth_ms is rw) {
    my gint    $f = $fx_group;
    my gdouble $d = 0e0;

    my $rv = fluid_synth_get_chorus_group_depth($!fs, $f, $d);
    $depth_ms = $d;
    $rv.not ?? $d !! Nil;
  }

  proto method get_chorus_group_level (|)
  { * }

  multi method get_chorus_group_level (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_chorus_group_level (Int() $fx_group, $level is rw) {
    my gint    $f = $fx_group;
    my gdouble $l = 0e0;

    my $rv = fluid_synth_get_chorus_group_level($!fs, $fx_group, $l);
    $level = $l;
    $rv.not ?? $l !! Nil;
  }

  proto method get_chorus_group_nr (|)
  { * }

  multi method get_chorus_group_nr (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_chorus_group_nr (Int() $fx_group, $nr is rw) {
    my gint $f = $fx_group;
    my gint $n = 0;

    my $rv = fluid_synth_get_chorus_group_nr($!fs, $fx_group, $n);
    $nr = $n;
    $rv.not ?? $n !! Nil;
  }

  proto method get_chorus_group_speed (|)
  { * }

  multi method get_chorus_group_speed (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_chorus_group_speed (Int() $fx_group, $speed is rw) {
    my gint    $f = $fx_group;
    my gdouble $s = 0e0;

    my $rv = fluid_synth_get_chorus_group_speed($!fs, $fx_group, $s);
    $speed = $s;
    $rv.not ?? $s !! Nil;
  }

  method get_chorus_group_type (Int() $fx_group, $type is rw) {
    my gint $f = $fx_group;
    my gint $t = 0;

    my $rv = fluid_synth_get_chorus_group_type($!fs, $fx_group, $t);
    $type = $t;
    $rv.not ?? $t !! Nil;
  }

  method get_chorus_level
    is DEPRECATED<get_chorus_group_level>
  {
    fluid_synth_get_chorus_level($!fs);
  }

  method get_chorus_nr
    is DEPRECATED<get_chorus_group_nr>
  {
    fluid_synth_get_chorus_nr($!fs);
  }

  method get_chorus_speed
    is DEPRECATED<get_chorus_group_speed>
  {
    fluid_synth_get_chorus_speed($!fs);
  }

  method get_chorus_type
    is DEPRECATED<get_chorus_group_type>
  {
    fluid_synth_get_chorus_type($!fs);
  }

  method get_cpu_load {
    fluid_synth_get_cpu_load($!fs);
  }

  method get_gain {
    fluid_synth_get_gain($!fs);
  }

  method get_gen (Int() $chan, Int() $param) {
    my guint ($c, $p) = ($chan, $param);

    fluid_synth_get_gen($!fs, $chan, $param);
  }

  method get_internal_bufsize {
    fluid_synth_get_internal_bufsize($!fs);
  }

  method get_ladspa_fx {
    fluid_synth_get_ladspa_fx($!fs);
  }

  proto method get_legato_mode (|)
  { * }

  multi method get_legato_mode (Int() $chan) {
    samewith($chan, $);
  }
  multi method get_legato_mode (Int() $chan, $legatomode is rw) {
    my gint $l = 0;

    fluid_synth_get_legato_mode($!fs, $chan, $l);
    $legatomode = $l;
  }

  proto method get_pitch_bend (|)
  { * }

  multi method get_pitch_bend (Int() $chan) {
    samewith($chan, $);
  }
  multi method get_pitch_bend (Int() $chan, $ppitch_bend is rw) {
    my gint $p = 0;

    fluid_synth_get_pitch_bend($!fs, $chan, $p);
    $ppitch_bend = $p;
  }

  proto method get_pitch_wheel_sens (|)
  { * }

  multi method get_pitch_wheel_sens (Int() $chan) {
    samewith($chan, $);
  }
  multi method get_pitch_wheel_sens (Int() $chan, $pval is rw) {
    my gint $p = 0;

    fluid_synth_get_pitch_wheel_sens($!fs, $chan, $p);
    $pval = $p;
  }

  method get_polyphony {
    fluid_synth_get_polyphony($!fs);
  }

  proto method get_portamento_mode (|)
  { * }

  multi method get_portamento_mode (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_portamento_mode (Int() $chan,  $portamentomode is rw) {
    my gint $p = 0;

    my $rv = fluid_synth_get_portamento_mode($!fs, $chan, $p);
    $portamentomode = $p;
    $rv.not ?? $p !! Nil;
  }

  proto method get_program (|)
  { * }

  multi method get_program (Int() $chan) {
    samewith($chan, $, $, $);
  }
  multi method get_program (
    Int() $chan,
          $sfont_id   is rw,
          $bank_num   is rw,
          $preset_num is rw
  ) {
    my gint  $c          = $chan;
    my gint ($s, $b, $p) = 0 xx 3;

    my $rv = fluid_synth_get_program($!fs, $chan, $s, $b, $p);
    ($sfont_id, $bank_num, $preset_num) = ($s, $b, $p);
    $rv.not ?? ($sfont_id, $bank_num, $preset_num) !! Nil;
  }

  method get_reverb_damp {
    fluid_synth_get_reverb_damp($!fs);
  }

  proto method get_reverb_group_damp (|)
  { * }

  multi method get_reverb_group_damp (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_reverb_group_damp (Int() $fx_group, $damping is rw) {
    my gdouble $d = 0e0;

    my $rv = fluid_synth_get_reverb_group_damp($!fs, $fx_group, $d);
    $damping = $d;
    $rv.not ?? $d !! Nil;
  }

  proto method get_reverb_group_level (|)
  { * }

  multi method get_reverb_group_level (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_reverb_group_level (Int() $fx_group, $level is rw) {
    my gdouble $l = 0e0;

    my $rv = fluid_synth_get_reverb_group_level($!fs, $fx_group, $l);
    $level = $l;
    $rv.not ?? $l !! Nil;
  }

  proto method get_reverb_group_roomsize (|)
  { * }

  multi method get_reverb_group_roomsize (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_reverb_group_roomsize (Int() $fx_group, $roomsize is rw) {
    my gdouble $r = 0e0;

    my $rv = fluid_synth_get_reverb_group_roomsize($!fs, $fx_group, $r);
    $roomsize = $r;
    $rv.not ?? $r !! Nil;
  }

  proto method get_reverb_group_width (|)
  { * }

  multi method get_reverb_group_width (Int() $fx_group) {
    samewith($fx_group, $);
  }
  multi method get_reverb_group_width (Int() $fx_group, $width is rw) {
    my gdouble $w = 0e0;

    my $rv = fluid_synth_get_reverb_group_width($!fs, $fx_group, $w);
    $width = $w;
    $rv.not ?? $w !! Nil;
  }

  method get_reverb_level {
    fluid_synth_get_reverb_level($!fs);
  }

  method get_reverb_roomsize {
    fluid_synth_get_reverb_roomsize($!fs);
  }

  method get_reverb_width {
    fluid_synth_get_reverb_width($!fs);
  }

  method get_settings {
    fluid_synth_get_settings($!fs);
  }

  method get_sfont (Int() $num) {
    my gint $n = $num;

    fluid_synth_get_sfont($!fs, $n);
  }

  method get_sfont_by_id (Int() $id) {
    my gint $i = $id;

    fluid_synth_get_sfont_by_id($!fs, $i);
  }

  method get_sfont_by_name (Str() $name) {
    fluid_synth_get_sfont_by_name($!fs, $name);
  }

  method get_voicelist (fluid_voice_t() $buf, Int() $bufsize, Int() $ID) {
    my gint ($b, $i) = ($bufsize, $ID);

    fluid_synth_get_voicelist($!fs, $buf, $b, $i);
  }

  method handle_midi_event (fluid_midi_event_t() $event) {
    fluid_synth_handle_midi_event($!fs, $event);
  }

  method key_pressure (Int() $chan, Int() $key, Int() $val) {
    my gint ($c, $k, $v) = ($chan, $key, $val);

    fluid_synth_key_pressure($!fs, $chan, $key, $val);
  }

  method noteoff (Int() $chan, Int() $key) {
    my gint ($c, $k) = ($chan, $key);

    fluid_synth_noteoff($!fs, $c, $k);
  }

  method noteon (Int() $chan, Int() $key, Int() $vel) {
    my gint ($c, $k, $v) = ($chan, $key, $vel);

    fluid_synth_noteon($!fs, $c, $k, $v);
  }

  proto method nwrite_float (|)
  { * }

  multi method nwrite_float (@left, @right, @fx_left, @fx_right) {
    samewith(
      @left.elems,
      ArrayToCArray(CArray[gfloat], @left),
      ArrayToCArray(CArray[gfloat], @right),
      ArrayToCArray(CArray[gfloat], @fx_left),
      ArrayToCArray(CArray[gfloat], @fx_right)
    );
  }
  multi method nwrite_float (
    Int()                  $len,
    CArray[CArray[gfloat]] $left,
    CArray[CArray[gfloat]] $right,
    CArray[CArray[gfloat]] $fx_left,
    CArray[CArray[gfloat]] $fx_right
  ) {
    my gint $l = $len;

    # cw: -XXX- Needs parameters or types fixed!
    # fluid_synth_nwrite_float($!fs, $l, $left, $right, $fx_left, $fx_right);
  }

  method pin_preset (Int() $sfont_id, Int() $bank_num, Int() $preset_num) {
    my gint ($s, $b, $p) = ($sfont_id, $bank_num, $preset_num);

    fluid_synth_pin_preset($!fs, $s, $b, $p);
  }

  method pitch_bend (Int() $chan, Int() $val) {
    my gint ($c, $v) = ($chan, $val);

    fluid_synth_pitch_bend($!fs, $c, $v);
  }

  method pitch_wheel_sens (Int() $chan, Int() $val) {
    my gint ($c, $v) = ($chan, $val);

    fluid_synth_pitch_wheel_sens($!fs, $c, $v);
  }

  # cw: Expect there to be more multis!
  multi method process (
    Int()                   $len,
    CArray[CArray[gfloat]]  $fx,
    CArray[CArray[gfloat]]  $out  = CArray[CArray[gfloat]],
    Int()                  :$nfx  = (self.count_effect_channels *
                                     self.count_effect_groups) / 2,
    Int()                  :$nout = 0
  ) {
    samewith($len, $nfx, $fx, $nout, $out);
  }
  multi method process (
    Int()                  $len,
    Int()                  $nfx,
    CArray[CArray[gfloat]] $fx,
    Int()                  $nout = 0,
    CArray[CArray[gfloat]] $out  = CArray[CArray[gfloat]]
  ) {
    my gint ($l, $nf, $no) = ($len, $nfx, $nout);

    fluid_synth_process($!fs, $l, $nf, $fx, $no, $out);
  }

  method program_change (Int() $chan, Int() $program) {
    my gint ($c, $p) = ($chan, $program);

    fluid_synth_program_change($!fs, $c, $p);
  }

  method program_reset {
    fluid_synth_program_reset($!fs);
  }

  method program_select (
    Int() $chan,
    Int() $sfont_id,
    Int() $bank_num,
    Int() $preset_num
  ) {
    my gint ($c, $s, $b, $p) = ($chan, $sfont_id, $bank_num, $preset_num);

    fluid_synth_program_select($!fs, $c, $s, $b, $p);
  }

  method program_select_by_sfont_name (
    Int() $chan,
    Str() $sfont_name,
    Int() $bank_num,
    Int() $preset_num
  ) {
    my gint ($c, $b, $p) = ($chan, $bank_num, $preset_num);

    fluid_synth_program_select_by_sfont_name($!fs, $c, $sfont_name, $b, $p);
  }

  method remove_default_mod (fluid_mod_t() $mod) {
    fluid_synth_remove_default_mod($!fs, $mod);
  }

  method remove_sfont (fluid_sfont_t() $sfont) {
    fluid_synth_remove_sfont($!fs, $sfont);
  }

  method reset_basic_channel (Int() $chan) {
    my gint $c = $chan;

    fluid_synth_reset_basic_channel($!fs, $c);
  }

  method reverb_on (Int() $fx_group, Int() $on) {
    my gint ($f, $o) = ($fx_group, $on);

    fluid_synth_reverb_on($!fs, $f, $o);
  }

  method set_bank_offset (Int() $sfont_id, Int() $offset) {
    my gint ($s, $o) = ($sfont_id, $offset);

    fluid_synth_set_bank_offset($!fs, $s, $o);
  }

  method set_basic_channel (Int() $chan, Int() $mode, Int() $val) {
    my gint ($c, $m, $v) = ($chan, $mode, $val);

    fluid_synth_set_basic_channel($!fs, $c, $m, $v);
  }

  method set_breath_mode (Int() $chan, Int() $breathmode) {
    my gint ($c, $b) = ($chan, $breathmode);

    fluid_synth_set_breath_mode($!fs, $c, $b);
  }

  method set_channel_type (Int() $chan, Int() $type) {
    my gint ($c, $t) = ($chan, $type);

    fluid_synth_set_channel_type($!fs, $c, $t);
  }

  method set_chorus (
    Int() $nr,
    Num() $level,
    Num() $speed,
    Num() $depth_ms,
    Int() $type
  ) {
    my gint    ($n, $t)     = ($nr, $type);
    my gdouble ($l, $s, $d) = ($level, $speed, $depth_ms);

    fluid_synth_set_chorus($!fs, $n, $l, $s, $d, $t);
  }

  method set_chorus_depth (Num() $depth_ms) {
    my gdouble $d = $depth_ms;

    fluid_synth_set_chorus_depth($!fs, $d);
  }

  method set_chorus_group_depth (Int() $fx_group, Num() $depth_ms) {
    my gint    $f = $fx_group;
    my gdouble $d = $depth_ms;

    fluid_synth_set_chorus_group_depth($!fs, $f, $d);
  }

  method set_chorus_group_level (Int() $fx_group, Num() $level) {
    my gint    $f = $fx_group;
    my gdouble $l = $level;

    fluid_synth_set_chorus_group_level($!fs, $fx_group, $level);
  }

  method set_chorus_group_nr (Int() $fx_group, Int() $nr) {
    my gint ($f, $n) = ($fx_group, $nr);

    fluid_synth_set_chorus_group_nr($!fs, $f, $n);
  }

  method set_chorus_group_speed (Int() $fx_group, Num() $speed) {
    my gint    $f = $fx_group;
    my gdouble $s = $speed;

    fluid_synth_set_chorus_group_speed($!fs, $f, $s);
  }

  method set_chorus_group_type (Int() $fx_group, Int() $type) {
    my gint ($f, $t) = ($fx_group, $type);

    fluid_synth_set_chorus_group_type($!fs, $f, $t);
  }

  method set_chorus_level (Num() $level) {
    my gdouble $l = $level;

    fluid_synth_set_chorus_level($!fs, $l);
  }

  method set_chorus_nr (Int() $nr) {
    my gint $n = $nr;

    fluid_synth_set_chorus_nr($!fs, $n);
  }

  method set_chorus_on (Int() $on) {
    my gint $o = $on;

    fluid_synth_set_chorus_on($!fs, $o);
  }

  method set_chorus_speed (Num() $speed) {
    my gdouble $s = $speed;

    fluid_synth_set_chorus_speed($!fs, $s);
  }

  method set_chorus_type (Int() $type) {
    my gint $t = $type;

    fluid_synth_set_chorus_type($!fs, $t);
  }

  method set_custom_filter (Int() $flags) {
    my gint $f = $flags;

    fluid_synth_set_custom_filter($!fs, $f);
  }

  method set_gain (Num() $gain) {
    my gfloat $g = $gain;

    fluid_synth_set_gain($!fs, $g);
  }

  method set_gen (Int() $chan, Int() $param, Num() $value) {
    my gint   ($c, $p) = ($chan, $param);
    my gfloat  $v      = $value;

    fluid_synth_set_gen($!fs, $c, $p, $v);
  }

  method set_interp_method (Int() $chan, Int() $interp_method) {
    my gint ($c, $i) = ($chan, $interp_method);

    fluid_synth_set_interp_method($!fs, $c, $i);
  }

  method set_legato_mode (Int() $chan, Int() $legatomode) {
    my gint ($c, $l) = ($chan, $legatomode);

    fluid_synth_set_legato_mode($!fs, $c, $l);
  }

  method set_polyphony (Int() $polyphony) {
    my gint $p = $polyphony;

    fluid_synth_set_polyphony($!fs, $p);
  }

  method set_portamento_mode (Int() $chan, Int() $portamentomode) {
    my gint ($c, $p) = ($chan, $portamentomode);

    fluid_synth_set_portamento_mode($!fs, $c, $p);
  }

  method set_reverb (
    Num() $roomsize,
    Num() $damping,
    Num() $width,
    Num() $level
  ) {
    my gdouble ($r, $d, $w, $l) = ($roomsize, $damping, $width, $level);

    fluid_synth_set_reverb($!fs, $r, $d, $w, $l);
  }

  method set_reverb_damp (Num() $damping) {
    my gdouble $d = $damping;

    fluid_synth_set_reverb_damp($!fs, $damping);
  }

  method set_reverb_group_damp (Int() $fx_group, Num() $damping) {
    my gint    $f = $fx_group;
    my gdouble $d = $damping;

    fluid_synth_set_reverb_group_damp($!fs, $fx_group, $damping);
  }

  method set_reverb_group_level (Int() $fx_group, Num() $level) {
    my gint    $f = $fx_group;
    my gdouble $l = $level;

    fluid_synth_set_reverb_group_level($!fs, $fx_group, $level);
  }

  method set_reverb_group_roomsize (Int() $fx_group, Num() $roomsize) {
    my gint    $f = $fx_group;
    my gdouble $r = $roomsize;

    fluid_synth_set_reverb_group_roomsize($!fs, $f, $r);
  }

  method set_reverb_group_width (Int() $fx_group, Num() $width) {
    my gint    $f = $fx_group;
    my gdouble $w = $width;

    fluid_synth_set_reverb_group_width($!fs, $fx_group, $width);
  }

  method set_reverb_level (Num() $level) {
    my gdouble $l = $level;

    fluid_synth_set_reverb_level($!fs, $l);
  }

  method set_reverb_on (Int() $on) {
    my gint $o = $on;

    fluid_synth_set_reverb_on($!fs, $o);
  }

  method set_reverb_roomsize (Num() $roomsize) {
    my gdouble $r = $roomsize;

    fluid_synth_set_reverb_roomsize($!fs, $r);
  }

  method set_reverb_width (Num() $width) {
    my gdouble $w = $width;

    fluid_synth_set_reverb_width($!fs, $w);
  }

  method set_sample_rate (Num() $sample_rate) {
    my gfloat $s = $sample_rate;

    fluid_synth_set_sample_rate($!fs, $s);
  }

  method sfcount {
    fluid_synth_sfcount($!fs);
  }

  method sfload (Str() $filename, Int() $reset_presets) {
    my $r = $reset_presets;

    fluid_synth_sfload($!fs, $filename, $r);
  }

  method sfont_select (Int() $chan, Int() $sfont_id) {
    my gint ($c, $s) = ($chan, $sfont_id);

    fluid_synth_sfont_select($!fs, $c, $s);
  }

  method sfreload (Int() $id) {
    my gint $i = $id;

    fluid_synth_sfreload($!fs, $i);
  }

  method sfunload (Int() $id, Int() $reset_presets) {
    my gint ($i, $r) = ($id, $reset_presets);

    fluid_synth_sfunload($!fs, $i, $r);
  }

  method start (
    Int()          $id,
    fluid_preset_t $preset,
    Int()          $audio_chan,
    Int()          $midi_chan,
    Int()          $key,
    Int()          $vel
  ) {
    my ($i, $a, $m, $k, $v) = ($id, $audio_chan, $midi_chan, $key, $vel);

    fluid_synth_start($!fs, $i, $preset, $a, $m, $k, $v);
  }

  method start_voice (fluid_voice_t() $voice) {
    fluid_synth_start_voice($!fs, $voice);
  }

  method stop (Int() $id) {
    my gint $i = $id;

    fluid_synth_stop($!fs, $i);
  }

  multi method sysex (
                   @data,
    Int()          $dryrun   = False,
                  :$response = CArray[uint8],
    Int()         :$len      = @data.elems
  ) {
    die 'Invalid length specified!' if $len > @data.elems;

    samewith(
      ArrayToCArray(uint8, @data),
      $len,
      $response,
      $,
      $,
      $dryrun
    );
  }
  multi method sysex (
    Str    $data,
    Int()  $dryrun   = False,
          :$response = CArray[uint8],
    Int() :$len,
          :$encoding = 'utf8'
  ) {
    samewith(
       $data.encode($encoding),
       $dryrun,
      :$response,
      :$len
    );
  }
  multi method sysex (
    Buf    $data,
    Int()  $dryrun   = False,
          :$response = CArray[uint8],
    Int() :$len
  ) {
    samewith(
      CArray[uint8].new($data),
      $data.bytes,
      $response,
      $,
      $,
      $dryrun
    );
  }
  multi method sysex(
    CArray[uint8] $data,
    Int()         $len,
    CArray[uint8] $response,
                  $response_len is rw,
                  $handled      is rw,
    gint          $dryrun
  ) {
    my gint ($l, $rl, $h, $d) = ($len, 0, 0, $dryrun);

    # cw: -XXX- Needs parameters or types fixed!
    #my $rv = fluid_synth_sysex($!fs, $data, $l, $response, $rl, $h, $dryrun);
    ($response, $handled) = ($rl, $h);
    #$rv.not ?? ($response, $handled) !! Nil;
  }

  method system_reset {
    fluid_synth_system_reset($!fs);
  }

  proto method tune_notes (|)
  { * }

  multi method tune_notes (
    Int() $bank,
    Int() $prog,
          @keys,
          @pitch,
    Int() $apply
  ) {
    samewith(
      $bank,
      $prog,
      @keys.elems,
      ArrayToCArray(gint,    @keys),
      ArrayToCArray(gdouble, @pitch),
      $apply
    );
  }
  multi method tune_notes (
    Int()           $bank,
    Int()           $prog,
    Int()           $len,
    CArray[gint]    $keys,
    CArray[gdouble] $pitch,
    Int()           $apply
  ) {
    my gint ($b, $p, $l, $a) = ($bank, $prog, $len, $apply);

    die "<keys> array is not the right size"  unless $keys.elems  <= $len;
    die "<pitch> array is not the right size" unless $pitch.elems <= $len;

    fluid_synth_tune_notes($!fs, $b, $p, $l, $keys, $pitch, $a);
  }

  proto method tuning_dump (|)
  { * }

  multi method tuning_dump (
    Int()  $bank,
    Int()  $prog,
    Str()  $name,
          :$raw   = False,
    Int() :$len   = $name.chars
  ) {
    my $ca = CArray[gdouble].allocate(128);

    samewith($bank, $prog, $name, $len, :$raw);
  }
  multi method tuning_dump (
    Int()            $bank,
    Int()            $prog,
    Str()            $name,
    Int()            $len,
    CArray[gdouble]  $pitch,         #= Length of 128,
                    :$raw    = False
  ) {
    my ($b, $p, $l) = ($bank, $prog, $len);

    fluid_synth_tuning_dump($!fs, $b, $p, $name, $l, $pitch);

    $raw.not ?? CArrayToArray($pitch) !! $pitch;
  }

  proto method tuning_iteration_next (|)
  { * }

  multi method tuning_iteration_next {
    samewith($, $);
  }
  multi method tuning_iteration_next ($bank is rw, $prog is rw) {
    my gint ($b, $p) = 0 xx 2;

    fluid_synth_tuning_iteration_next($!fs, $b, $p);
    ($bank, $prog) = ($b, $p);
  }

  method tuning_iteration_start {
    fluid_synth_tuning_iteration_start($!fs);
  }

  method unpin_preset (Int() $sfont_id, Int() $bank_num, Int() $preset_num) {
    my gint ($s, $b, $p) = ($sfont_id, $bank_num, $preset_num);

    fluid_synth_unpin_preset($!fs, $s, $b, $p);
  }

  method unset_program (Int() $chan) {
    my gint $c = $chan;

    fluid_synth_unset_program($!fs, $c);
  }

  method write_float (
    Int()   $len,
    Pointer $lout,
    Int()   $loff,
    Int()   $lincr,
    Pointer $rout,
    Int()   $roff,
    Int()   $rincr
  ) {
    my gint ($le, $lo, $li, $ro, $ri) = ($len, $lout, $lincr, $roff, $rincr);

    fluid_synth_write_float($!fs, $le, $lout, $lo, $li, $rout, $ro, $ri);
  }

  method write_s16 (
    Int()   $len,
    Pointer $lout,
    Int()   $loff,
    Int()   $lincr,
    Pointer $rout,
    Int()   $roff,
    Int()   $rincr
  ) {
    my gint ($le, $lo, $li, $ro, $ri) = ($len, $lout, $lincr, $roff, $rincr);

    fluid_synth_write_s16($!fs, $le, $loff, $lo, $li, $rout, $ro, $ri);
  }

}
