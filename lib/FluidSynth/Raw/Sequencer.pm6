use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Sequencer;


### /usr/include/fluidsynth/seq.h

sub fluid_sequencer_client_is_dest (fluid_sequencer_t $seq, fluid_seq_id_t $id)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_count_clients (fluid_sequencer_t $seq)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_sequencer (fluid_sequencer_t $seq)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_get_client_id (fluid_sequencer_t $seq, gint $index)
  returns fluid_seq_id_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_get_client_name (
  fluid_sequencer_t $seq,
  fluid_seq_id_t    $id
)
  returns Str
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_get_tick (fluid_sequencer_t $seq)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_get_time_scale (fluid_sequencer_t $seq)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_get_use_system_timer (fluid_sequencer_t $seq)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_sequencer ()
  returns fluid_sequencer_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_sequencer2 (gint $use_system_timer)
  returns fluid_sequencer_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_process (fluid_sequencer_t $seq, gint $msec)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_register_client (
  fluid_sequencer_t $seq,
  Str               $name,
                    &callback (
                      guint,
                      fluid_event_t,
                      fluid_sequencer_t,
                      gpointer
                    ),
  Pointer           $data
)
  returns fluid_seq_id_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_remove_events (
  fluid_sequencer_t $seq,
  fluid_seq_id_t    $source,
  fluid_seq_id_t    $dest,
  gint              $type
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_send_at (
  fluid_sequencer_t $seq,
  fluid_event_t     $evt,
  gint              $time,
  gint              $absolute
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_send_now (fluid_sequencer_t $seq, fluid_event_t $evt)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_set_time_scale (fluid_sequencer_t $seq, gdouble $scale)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_unregister_client (
  fluid_sequencer_t $seq,
  fluid_seq_id_t    $id
)
  is native(fluidsynth)
  is export
{ * }


### /usr/include/fluidsynth/seqbind.h

sub fluid_sequencer_add_midi_event_to_buffer (
  CArray[uint8]      $data,
  fluid_midi_event_t $event
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sequencer_register_fluidsynth (
  fluid_sequencer_t $seq,
  fluid_synth_t     $synth
)
  returns fluid_seq_id_t
  is native(fluidsynth)
  is export
{ * }
