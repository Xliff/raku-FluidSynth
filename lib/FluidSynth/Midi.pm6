use v6.c;

# No classes here. This will be broken up into several.

method delete_driver {
  delete_fluid_midi_driver($!fm);
}

method delete_router {
  delete_fluid_midi_router($!fm);
}

method delete_router_rule {
  delete_fluid_midi_router_rule($!fm);
}

method dump_postrouter (fluid_midi_event_t $event) {
  fluid_midi_dump_postrouter($!fm, $event);
}

method dump_prerouter (fluid_midi_event_t $event) {
  fluid_midi_dump_prerouter($!fm, $event);
}

method new_driver (handle_midi_event_func_t $handler, Pointer $event_handler_data) {
  new_fluid_midi_driver($!fm, $handler, $event_handler_data);
}

method new_router (handle_midi_event_func_t $handler, Pointer $event_handler_data) {
  new_fluid_midi_router($!fm, $handler, $event_handler_data);
}

method new_router_rule {
  new_fluid_midi_router_rule($!fm);
}

method router_add_rule (fluid_midi_router_rule_t $rule, gint $type) {
  fluid_midi_router_add_rule($!fm, $rule, $type);
}

method router_clear_rules {
  fluid_midi_router_clear_rules($!fm);
}

method router_handle_midi_event (fluid_midi_event_t $event) {
  fluid_midi_router_handle_midi_event($!fm, $event);
}

method router_rule_set_chan (gint $min, gint $max, gfloat $mul, gint $add) {
  fluid_midi_router_rule_set_chan($!fm, $min, $max, $mul, $add);
}

method router_rule_set_param1 (gint $min, gint $max, gfloat $mul, gint $add) {
  fluid_midi_router_rule_set_param1($!fm, $min, $max, $mul, $add);
}

method router_rule_set_param2 (gint $min, gint $max, gfloat $mul, gint $add) {
  fluid_midi_router_rule_set_param2($!fm, $min, $max, $mul, $add);
}

method router_set_default_rules {
  fluid_midi_router_set_default_rules($!fm);
}
