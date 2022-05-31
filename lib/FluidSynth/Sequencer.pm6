use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Sequencer;

class FluidSynth::Sequencer {
  has fluid_sequencer_t $!fs is implementor;

  submethod BUILD ( :$fluid-seq ) {
    $!fs = $fluid-seq
  }

  method FluidSynth::Raw::Definitions::fluid_sequencer_t
  { $!fs }

  method new (fluid_sequencer_t $fluid-seq) {
    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }

  method new_fluid_sequencer {
    my $fluid-seq = new_fluid_sequencer();

    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }

  method new_fluid_sequencer2 {
    my $fluid-seq = new_fluid_sequencer2($!fs);

    $fluid-seq ?? self.bless( :$fluid-seq ) !! Nil
  }

  method client_is_dest (fluid_seq_id_t $id) {
    fluid_sequencer_client_is_dest($!fs, $id);
  }

  method count_clients {
    fluid_sequencer_count_clients($!fs);
  }

  method delete_fluid_sequencer {
    delete_fluid_sequencer($!fs);
  }

  method cleanup {
    self.delete_fluid_sequencer;
  }

  method get_client_id (Int() $index) {
    my gint $i = $index;

    fluid_sequencer_get_client_id($!fs, $index);
  }

  method get_client_name (fluid_seq_id_t $id) {
    fluid_sequencer_get_client_name($!fs, $id);
  }

  method get_tick {
    fluid_sequencer_get_tick($!fs);
  }

  method get_time_scale {
    fluid_sequencer_get_time_scale($!fs);
  }

  method get_use_system_timer {
    fluid_sequencer_get_use_system_timer($!fs);
  }

  method process (Int() $msec) {
    my gint $m = $msec;

    fluid_sequencer_process($!fs, $msec);
  }

  method register_client (Str() $name, &callback, gpointer $data) {
    fluid_sequencer_register_client($!fs, $name, &callback, $data);
  }

  method remove_events (
    fluid_seq_id_t $source,
    fluid_seq_id_t $dest,
    Int()          $type
  ) {
    my gint $t = $type;

    fluid_sequencer_remove_events($!fs, $source, $dest, $t);
  }

  method send_at (fluid_event_t $evt, Int() $time, Int() $absolute) {
    my gint ($t, $a) = ($time, $absolute);

    fluid_sequencer_send_at($!fs, $evt, $t, $a);
  }

  method send_now (fluid_event_t $evt) {
    fluid_sequencer_send_now($!fs, $evt);
  }

  method set_time_scale (Num() $scale) {
    my gdouble $s = $scale;

    fluid_sequencer_set_time_scale($!fs, $s);
  }

  method unregister_client (fluid_seq_id_t $id) {
    fluid_sequencer_unregister_client($!fs, $id);
  }

}
