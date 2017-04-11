collection @events, object_root: false
attributes(*Event.column_names - ["created_at", "updated_at"])
child(:event_instances, object_root: false) {
  attributes(*EventInstance.column_names  - ["created_at", "updated_at"])
}
