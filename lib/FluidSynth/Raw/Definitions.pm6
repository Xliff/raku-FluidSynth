use v6.c;

use NativeCall;

use FluidSynth::Roles::Pointers;

unit package FluidSynth::Raw::Definitions;

our $FLUIDSYNTH-DEBUG is export;

constant forced = 0;

constant fluidsynth is export = 'fluidsynth',v3;

constant short is export := uint8;

constant realUInt is export = $*KERNEL.bits == 32 ?? uint32 !! uint64;
constant realInt  is export = $*KERNEL.bits == 32 ?? int32  !! int64;

constant FLUID_OK                       is export = 0;
constant FLUID_FAILED                   is export = -1;

constant gboolean                       is export := uint32;
constant gchar                          is export := Str;
constant gconstpointer                  is export := Pointer;
constant gdouble                        is export := num64;
constant gfloat                         is export := num32;
constant gint                           is export := int32;
constant gint8                          is export := int8;
constant gint16                         is export := int16;
constant gint32                         is export := int32;
constant gint64                         is export := int64;
constant glong                          is export := int64;
constant goffset                        is export := int64;
constant gpointer                       is export := Pointer;
constant gsize                          is export := uint64;
constant gssize                         is export := int64;
constant gshort                         is export := int16;
constant guchar                         is export := Str;
constant gushort                        is export := uint16;
constant guint                          is export := uint32;
constant guint8                         is export := uint8;
constant guint16                        is export := uint16;
constant guint32                        is export := uint32;
constant guint64                        is export := uint64;
constant gulong                         is export := uint64;
constant gunichar                       is export := uint32;
constant gunichar2                      is export := uint16;
constant va_list                        is export := Pointer;
constant time_t                         is export := uint64;
constant uid_t                          is export := uint32;
constant gid_t                          is export := uint32;
constant pid_t                          is export := int32;

constant fluid_seq_id_t                 is export := uint32;

class fluid_audio_driver_t  is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_event_t         is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_settings_t      is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_sequencer_t     is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_synth_t         is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_voice_t         is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_file_renderer_t is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_mod_t           is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_sample_t        is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_sfloader_t      is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_sfont_t         is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_preset_t        is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_ladspa_fx_t     is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
class fluid_midi_event_t    is repr<CPointer> is export does FluidSynth::Roles::Pointers { }
