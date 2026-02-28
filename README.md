# Dotfiles -- MacBook

Repositorio de archivos de configuracion personal, optimizado para **macOS en Apple Silicon (M2)**. El objetivo es mantener un entorno de terminal rapido, reproducible y visualmente pulido, aprovechando la aceleracion por GPU nativa del chip M2.

La configuracion esta centrada en:

- **WezTerm** como emulador de terminal, configurado en Lua con efectos de cristal (transparencia + desenfoque).
- **Zsh** como shell, potenciado con un stack de herramientas modernas.
- **Starship** como prompt minimalista y de alto rendimiento.

---

## Contenido del Repositorio

| Archivo          | Descripcion                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `.wezterm.lua`   | Configuracion de WezTerm: tema, fuente, opacidad, blur, padding y cursor.  |
| `.zshrc`         | Configuracion del shell Zsh: inicializacion de herramientas y aliases.      |
| `.zprofile`      | Variables de entorno del sistema y configuracion de Homebrew.               |
| `README.md`      | Este archivo.                                                               |

---

## Stack de Herramientas

| Herramienta | Funcion                                              | Sitio                                      |
|-------------|------------------------------------------------------|---------------------------------------------|
| WezTerm     | Emulador de terminal con aceleracion GPU, config Lua | https://wezfurlong.org/wezterm/             |
| Starship    | Prompt multiplataforma, rapido y personalizable      | https://starship.rs/                        |
| Zoxide      | Reemplazo inteligente de `cd` (comando `z`)          | https://github.com/ajeetdsouza/zoxide       |
| FZF         | Buscador difuso para historial y archivos            | https://github.com/junegunn/fzf             |
| Atuin       | Historial de comandos sincronizado y mejorado        | https://github.com/atuinsh/atuin            |

---

## Requisitos Previos

### 1. Homebrew

Homebrew es el gestor de paquetes necesario para instalar todas las herramientas. Si aun no lo tienes:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Despues de la instalacion, asegurate de que Homebrew esta en tu `PATH`. El archivo `.zprofile` de este repositorio ya incluye la linea necesaria:

```bash
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

### 2. Nerd Fonts (JetBrains Mono)

La configuracion de WezTerm utiliza **JetBrains Mono** con soporte para iconos Nerd Font. Instalala con Homebrew:

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### 3. Herramientas del Stack

Instala todas las herramientas de una sola vez:

```bash
brew install wezterm starship zoxide fzf atuin
```

---

## Instalacion Rapida

### 1. Clonar el repositorio

```bash
git clone https://github.com/<tu-usuario>/dotfiles.git ~/dotfiles
```

### 2. Crear los enlaces simbolicos

Los symlinks conectan los archivos del repositorio con las rutas donde el sistema los espera (`$HOME`). Usa `ln -sf` para crearlos (sobreescribe si ya existen):

```bash
ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
mkdir -p ~/.config && ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
```

### 3. Recargar la configuracion

Cierra y vuelve a abrir WezTerm, o recarga el shell manualmente:

```bash
source ~/.zshrc
```

---

## Atajos y Aliases

Aliases definidos en `.zshrc`:

| Alias   | Comando Equivalente   | Descripcion                              |
|---------|-----------------------|------------------------------------------|
| `gs`    | `git status`          | Muestra el estado del repositorio Git.   |
| `..`    | `cd ..`               | Sube un nivel en el arbol de directorios.|
| `gcli`  | `gemini --chat`       | Lanza el CLI de Gemini en modo chat.     |

### Aliases sugeridos para anadir

Puedes agregar mas aliases en la seccion correspondiente de `.zshrc`:

```bash
# Navegacion rapida
alias dot="cd ~/dotfiles"
alias conf="code ~/dotfiles"

# Git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline -15"

# Sistema
alias ll="ls -lAh"
alias reload="source ~/.zshrc"
```

---

## Personalizacion Estetica

La apariencia visual se controla completamente desde el archivo `.wezterm.lua`.

### Esquema de Colores

El esquema activo es **Tokyo Night**. WezTerm incluye cientos de esquemas. Para cambiarlo, edita la siguiente linea:

```lua
config.color_scheme = 'Tokyo Night'
```

Algunos esquemas alternativos recomendados:

| Esquema              | Estilo                   |
|----------------------|--------------------------|
| `Tokyo Night`        | Oscuro, tonos azules     |
| `Catppuccin Mocha`   | Oscuro, tonos pastel     |
| `Gruvbox Dark`       | Oscuro, tonos tierra     |
| `Kanagawa`           | Oscuro, inspirado en arte japones |
| `Rose Pine`          | Oscuro, tonos rosados    |

### Opacidad y Desenfoque

El efecto de cristal se consigue combinando transparencia y desenfoque del fondo. Ajusta estos valores en `.wezterm.lua`:

```lua
config.window_background_opacity = 0.90  -- Rango: 0.0 (transparente) a 1.0 (opaco)
config.macos_window_background_blur = 30 -- Intensidad del blur (0 = desactivado)
```

### Window Padding

El padding anade espacio entre el texto y los bordes de la ventana para una apariencia mas limpia:

```lua
config.window_padding = {
  left   = 20,
  right  = 20,
  top    = 20,
  bottom = 20,
}
```

### Cursor

El cursor esta configurado como una barra vertical fina con parpadeo suave, similar a editores de texto modernos:

```lua
config.default_cursor_style = 'SteadyBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'EaseIn'
config.cursor_blink_ease_out = 'EaseOut'
```

### Tab Bar

La barra de pestanas se oculta automaticamente cuando solo hay una pestana abierta, y usa un estilo minimalista integrado con el tema:

```lua
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
```

---

## Estructura del Entorno

```
$HOME
 ├── .wezterm.lua  -->  ~/dotfiles/.wezterm.lua   (symlink)
 ├── .zshrc        -->  ~/dotfiles/.zshrc          (symlink)
 ├── .zprofile     -->  ~/dotfiles/.zprofile        (symlink)
 └── dotfiles/
      ├── .wezterm.lua
      ├── .zshrc
      ├── .zprofile
      └── README.md
```

---

## Licencia

Este repositorio es de uso personal. Puedes usarlo como referencia o punto de partida para tu propia configuracion.
