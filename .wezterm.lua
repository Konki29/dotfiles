local wezterm = require 'wezterm'
local config = {}

-- Usar la configuración más reciente
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Estética y Fuentes
config.color_scheme = 'Tokyo Night'
-- Intentaremos con el nombre que el sistema te dio en el comando anterior
config.font = wezterm.font('JetBrains Mono')
config.font_size = 14.0

-- Efecto cristal para tu MacBook M2
config.window_background_opacity = 0.90
config.macos_window_background_blur = 30
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- Muestra los botones de cerrar/minimizar (semáforos)

-- Window Padding: espacio entre el texto y los bordes de la ventana
config.window_padding = {
  left   = 20,
  right  = 20,
  top    = 20,
  bottom = 20,
}

-- Cursor: barra vertical fina con parpadeo suave
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'EaseIn'
config.cursor_blink_ease_out = 'EaseOut'

-- Tab Bar: ocultar si solo hay una pestaña, estilo minimalista
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

-- Atajos de teclado (Keybindings)
config.keys = {
  { key = 't', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentTab { confirm = true } },
  -- Puedes añadir aquí todos los atajos que usabas en Linux
}

return config