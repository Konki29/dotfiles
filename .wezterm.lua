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
config.window_decorations = "RESIZE" -- Limpia los bordes superiores

-- Atajos de teclado (Keybindings)
config.keys = {
  { key = 't', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentTab { confirm = true } },
  -- Puedes añadir aquí todos los atajos que usabas en Linux
}

return config