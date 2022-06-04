use v6.c;

use NativeCall;
use Method::Also;

use FluidSynth::Raw::Traits;
use FluidSynth::Raw::Types;
use FluidSynth::Raw::Sequencer;

class FluidSynth::Sequencer {
  has fluid_sequencer_t $!fs is implementor;

  submethod BUILD ( :$fluid-seq ) {
    $!fs = $fluid-seq
  }

  method FluidSynth::Raw::Definitions::fluid_sequencer_t
    is also<fluid-ssequencer-t>
  { $!fs }

  multi method new (fluid_sequencer_t $fluid-seq) {
    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }
  multi method new {
    self.new_fluid_sequencer
  }
  multi method new (Int $use-system-seq) {
    self.new_fluid_sequencer2($use-system-seq);
  }


  method new_fluid_sequencer is also<new-fluid-sequencer> {
    my $fluid-seq = new_fluid_sequencer();

    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }

  method new_fluid_sequencer2 (Int() $use-system-seq)
    is also<new-fluid-sequencer2>
  {
    my gint $u = $use-system-seq.so.Int;

    my $fluid-seq = new_fluid_sequencer2($u);

    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }

  proto method add_midi_event_to_buffer (|)
    is static
  { * }

  multi method add_midi_event_to_buffer (
    Blob                 $data,
    fluid_midi_event_t() $event
  ) {
    samewith( CArray[uint8].new($data), $event );
  }
  multi method add_midi_event_to_buffer (
    CArray[uint8]        $data,
    fluid_midi_event_t() $event
  ) {
    fluid_sequencer_add_midi_event_to_buffer($data, $event);
  }

  method client_is_dest (Int() $id) is also<client-is-dest> {
    my fluid_seq_id_t $i = $id;

    fluid_sequencer_client_is_dest($!fs, $i);
  }

  method count_clients is also<count-clients> {
    fluid_sequencer_count_clients($!fs);
  }

  method delete_fluid_sequencer is also<delete-fluid-sequencer> {
    delete_fluid_sequencer($!fs);
  }

  method cleanup {
    self.delete_fluid_sequencer;
  }

  method get_client_id (Int() $index) is also<get-client-id> {
    my gint $i = $index;

    fluid_sequencer_get_client_id($!fs, $index);
  }

  method get_client_name (fluid_seq_id_t $id) is also<get-client-name> {
    fluid_sequencer_get_client_name($!fs, $id);
  }

  method get_tick
    is also<
      get-tick
      tick
    >
  {
    fluid_sequencer_get_tick($!fs);
  }

  method get_time_scale
    is also<
      get-time-scale
      time_scale
      time-scale
    >
  {
    fluid_sequencer_get_time_scale($!fs);
  }

  method get_use_system_timer
    is also<
      get-use-system-timer
      use_system_timer
      use-system-timer
    >
  {
    fluid_sequencer_get_use_system_timer($!fs);
  }

  method process (Int() $msec) {
    my gint $m = $msec;

    fluid_sequencer_process($!fs, $msec);
  }

  method register_client (Str() $name, &callback, gpointer $data = gpointer)
    is also<register-client>
  {
    fluid_sequencer_register_client($!fs, $name, &callback, $data);
  }

  method register_fluidsynth (fluid_synth_t() $synth)
    is also<register-fluidsynth>
  {
    fluid_sequencer_register_fluidsynth($!fs, $synth);
  }

  method remove_events (Int() $source, Int() $dest, Int() $type)
    is also<remove-events>
  {
    my fluid_seq_id_t ($s, $d) = ($source, $dest);
    my gint            $t      = $type;

    fluid_sequencer_remove_events($!fs, $s, $d, $t);
  }

  method send_at (fluid_event_t() $evt, Int() $time, Int() $absolute)
    is also<send-at>
  {
    my gint ($t, $a) = ($time, $absolute);

    fluid_sequencer_send_at($!fs, $evt, $t, $a);
  }

  method send_now (fluid_event_t() $evt) is also<send-now> {
    fluid_sequencer_send_now($!fs, $evt);
  }

  method set_time_scale (Num() $scale) is also<set-time-scale> {
    my gdouble $s = $scale;

    fluid_sequencer_set_time_scale($!fs, $s);
  }

  method unregister_client (Int() $id) is also<unregister-client> {
    my fluid_seq_id_t $i = $id;

    fluid_sequencer_unregister_client($!fs, $i);
  }

}
