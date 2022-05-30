use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Event;

class FluidSynth::Event {
  has fluid_event_t $!fe is implementor;

  submethod BUILD ( :$fluid-event ) {
    $!fe = $fluid-event;
  }

  multi method new (fluid_event_t $fluid-event) {
    $fluid-event ?? self.bless( :$fluid-event ) !! Nil;
  }
  multi method new_fluid_event {
    my $fluid-event = new_fluid_event($!fe);

    $fluid-event ?? self.bless( :$fluid-event ) !! Nil;
  }

  method all_notes_off (Int() $channel) {
    my gint $c = $channel;

    fluid_event_all_notes_off($!fe, $c);
  }

  method all_sounds_off (Int() $channel) {
    my gint $c = $channel;

    fluid_event_all_sounds_off($!fe, $c);
  }

  method bank_select (Int() $channel, Int() $bank_num) {
    my gint  $c = $channel;
    my short $b = $bank_num;

    fluid_event_bank_select($!fe, $c, $b);
  }

  method channel_pressure (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_channel_pressure($!fe, $c, $v);
  }

  method chorus_send (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_chorus_send($!fe, $c, $v);
  }

  method control_change (Int() $channel, Int() $control, Int() $val) {
    my gint ($c, $v) = ($channel, $val);
    my short $ctrl   = $control;

    fluid_event_control_change($!fe, $c, $ctrl, $v);
  }

  method delete_fluid_event {
    delete_fluid_event($!fe);
  }

  method get_bank {
    fluid_event_get_bank($!fe);
  }

  method get_channel {
    fluid_event_get_channel($!fe);
  }

  method get_control {
    fluid_event_get_control($!fe);
  }

  method get_data {
    fluid_event_get_data($!fe);
  }

  method get_dest {
    fluid_event_get_dest($!fe);
  }

  method get_duration {
    fluid_event_get_duration($!fe);
  }

  method get_key {
    fluid_event_get_key($!fe);
  }

  method get_pitch {
    fluid_event_get_pitch($!fe);
  }

  method get_program {
    fluid_event_get_program($!fe);
  }

  method get_scale {
    fluid_event_get_scale($!fe);
  }

  method get_sfont_id {
    fluid_event_get_sfont_id($!fe);
  }

  method get_source {
    fluid_event_get_source($!fe);
  }

  method get_type {
    fluid_event_get_type();
  }

  method get_value {
    fluid_event_get_value($!fe);
  }

  method get_velocity {
    fluid_event_get_velocity($!fe);
  }

  method key_pressure (Int() $channel, Int() $key, Int() $val) {
    my gint ($c, $v) = ($channel, $val);
    my short $k      = $key;

    fluid_event_key_pressure($!fe, $c, $k, $v);
  }

  method modulation (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_modulation($!fe, $c, $v);
  }

  method note (Int() $channel, Int() $key, Int() $vel, Int() $duration) {
    my gint  ($c, $d) = ($channel, $duration);
    my short ($k, $v) = ($key, $vel);

    fluid_event_note($!fe, $c, $k, $v, $d);
  }

  method noteoff (Int() $channel, Int() $key) {
    my gint ($c, $k) = ($channel, $key);

    fluid_event_noteoff($!fe, $c, $k);
  }

  method noteon (Int() $channel, Int() $key, Int() $vel) {
    my gint   $c      = $channel;
    my short ($k, $v) = ($key, $vel);

    fluid_event_noteon($!fe, $c, $k, $v);
  }

  method pan (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_pan($!fe, $c, $v);
  }

  method pitch_bend (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_pitch_bend($!fe, $c, $v);
  }

  method pitch_wheelsens (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_pitch_wheelsens($!fe, $c, $v);
  }

  method program_change (Int() $channel, Int() $preset_num) {
    my gint ($c, $p) = ($channel, $preset_num);

    fluid_event_program_change($!fe, $c, $p);
  }

  method program_select (
    Int() $channel,
    Int() $sfont_id,
    Int() $bank_num,
    Int() $preset_num
  ) {
    my gint  ($c, $s) = ($channel, $sfont_id);
    my short ($b, $p) = ($bank_num, $preset_num);

    fluid_event_program_select($!fe, $c, $s, $b, $p);
  }

  method reverb_send (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_reverb_send($!fe, $c, $v);
  }

  method scale (Num() $new_scale) {
    my gdouble $n = $new_scale;

    fluid_event_scale($!fe, $n);
  }

  method set_dest (fluid_seq_id_t $dest) {
    fluid_event_set_dest($!fe, $dest);
  }

  method set_source (fluid_seq_id_t $src) {
    fluid_event_set_source($!fe, $src);
  }

  method sustain (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_sustain($!fe, $c, $v);
  }

  method system_reset {
    fluid_event_system_reset($!fe);
  }

  method timer (Pointer $data) {
    fluid_event_timer($!fe, $data);
  }

  method unregistering {
    fluid_event_unregistering($!fe);
  }

  method volume (Int() $channel, Int() $val) {
    my gint ($c, $v) = ($channel, $val);

    fluid_event_volume($!fe, $c, $v);
  }

}
