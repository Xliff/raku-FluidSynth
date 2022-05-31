use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Enums;

constant fluid_gen_type is export := uint32;
our enum fluid_gen_type_Enum (
    'GEN_STARTADDROFS',		          #= Sample start address offset (0-32767)
    'GEN_ENDADDROFS',	    	        #= Sample end address offset (-32767-0)
    'GEN_STARTLOOPADDROFS',		      #= Sample loop start address offset (-32767-32767)
    'GEN_ENDLOOPADDROFS',	 	        #= Sample loop end address offset (-32767-32767)
    'GEN_STARTADDRCOARSEOFS',       #= Sample start address coarse offset (X 32768)
    'GEN_MODLFOTOPITCH',		        #= Modulation LFO to pitch
    'GEN_VIBLFOTOPITCH',		        #= Vibrato LFO to pitch
    'GEN_MODENVTOPITCH',		        #= Modulation envelope to pitch
    'GEN_FILTERFC',		              #= Filter cutoff
    'GEN_FILTERQ',		              #= Filter Q
    'GEN_MODLFOTOFILTERFC',		      #= Modulation LFO to filter cutoff
    'GEN_MODENVTOFILTERFC',		      #= Modulation envelope to filter cutoff
    'GEN_ENDADDRCOARSEOFS',		      #= Sample end address coarse offset (X 32768)
    'GEN_MODLFOTOVOL',		          #= Modulation LFO to volume
    'GEN_UNUSED1',		              #= Unused
    'GEN_CHORUSSEND',		            #= Chorus send amount
    'GEN_REVERBSEND',		            #= Reverb send amount
    'GEN_PAN',		                  #= Stereo panning
    'GEN_UNUSED2',		              #= Unused
    'GEN_UNUSED3',		              #= Unused
    'GEN_UNUSED4',		              #= Unused
    'GEN_MODLFODELAY',		          #= Modulation LFO delay
    'GEN_MODLFOFREQ',		            #= Modulation LFO frequency
    'GEN_VIBLFODELAY',		          #= Vibrato LFO delay
    'GEN_VIBLFOFREQ',		            #= Vibrato LFO frequency
    'GEN_MODENVDELAY',		          #= Modulation envelope delay
    'GEN_MODENVATTACK',		          #= Modulation envelope attack
    'GEN_MODENVHOLD',		            #= Modulation envelope hold
    'GEN_MODENVDECAY',		          #= Modulation envelope decay
    'GEN_MODENVSUSTAIN',		        #= Modulation envelope sustain
    'GEN_MODENVRELEASE',		        #= Modulation envelope release
    'GEN_KEYTOMODENVHOLD',		      #= Key to modulation envelope hold
    'GEN_KEYTOMODENVDECAY',		      #= Key to modulation envelope decay
    'GEN_VOLENVDELAY',		          #= Volume envelope delay
    'GEN_VOLENVATTACK',		          #= Volume envelope attack
    'GEN_VOLENVHOLD',		            #= Volume envelope hold
    'GEN_VOLENVDECAY',		          #= Volume envelope decay
    'GEN_VOLENVSUSTAIN',		        #= Volume envelope sustain
    'GEN_VOLENVRELEASE',		        #= Volume envelope release
    'GEN_KEYTOVOLENVHOLD',		      #= Key to volume envelope hold
    'GEN_KEYTOVOLENVDECAY',		      #= Key to volume envelope decay
    'GEN_INSTRUMENT',		            #= Instrument ID (shouldn't be set by user)
    'GEN_RESERVED1',		            #= Reserved
    'GEN_KEYRANGE',		              #= MIDI note range
    'GEN_VELRANGE',		              #= MIDI velocity range
    'GEN_STARTLOOPADDRCOARSEOFS',		#= Sample start loop address coarse offset (X 32768)
    'GEN_KEYNUM',		                #= Fixed MIDI note number
    'GEN_VELOCITY',		              #= Fixed MIDI velocity value
    'GEN_ATTENUATION',		          #= Initial volume attenuation
    'GEN_RESERVED2',		            #= Reserved
    'GEN_ENDLOOPADDRCOARSEOFS',		  #= Sample end loop address coarse offset (X 32768)
    'GEN_COARSETUNE',		            #= Coarse tuning
    'GEN_FINETUNE',		              #= Fine tuning
    'GEN_SAMPLEID',		              #= Sample ID (shouldn't be set by user)
    'GEN_SAMPLEMODE',		            #= Sample mode flags
    'GEN_RESERVED3',		            #= Reserved
    'GEN_SCALETUNE',		            #= Scale tuning
    'GEN_EXCLUSIVECLASS',		        #= Exclusive class number
    'GEN_OVERRIDEROOTKEY',		      #= Sample root note override
    'GEN_PITCH',
    'GEN_CUSTOM_BALANCE',		        #= Balance @note Not a real SoundFont generator
    'GEN_CUSTOM_FILTERFC',		      #= Custom filter cutoff frequency
    'GEN_CUSTOM_FILTERQ',		        #= Custom filter Q
    'GEN_LAST'		                  #= @internal Value defines the count of generators (#fluid_gen_type)
);

constant fluid_player_tempo is export := guint32;
our enum fluid_player_tempo_Enum is export <
  FLUID_PLAYER_TEMPO_INTERNAL
  FLUID_PLAYER_TEMPO_EXTERNAL_BPM
  FLUID_PLAYER_TEMPO_EXTERNAL_MIDI
  FLUID_PLAYER_TEMPO_NBR
>;

constant fluid_midi_router_rule_type is export := guint32;
our enum fluid_midi_router_rule_typeEnum is export <
  FLUID_MIDI_ROUTER_RULE_NOTE
  FLUID_MIDI_ROUTER_RULE_CC
  FLUID_MIDI_ROUTER_RULE_PROG_CHANGE
  FLUID_MIDI_ROUTER_RULE_PITCH_BEND
  FLUID_MIDI_ROUTER_RULE_CHANNEL_PRESSURE
  FLUID_MIDI_ROUTER_RULE_KEY_PRESSURE
  FLUID_MIDI_ROUTER_RULE_COUNT
>;
