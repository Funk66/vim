; extends

; The literal text around the {{ }} actions is the file's own language (see lua/plugins/gotmpl.lua).
((text) @injection.content
  (#set-lang-from-tmpl-name! @injection.content)
  (#set! injection.combined))
