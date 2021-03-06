/*
 * PLUGINS TO KEEP AN EYE ON:
 * * hyperterm-base16-ocean-saturated (he's working on a vim copy of it too)
 *  - Also, look at this plugin for a lot of ideas:
 *    - tab title icons
 *    - cursor shape (hollow beam)
 *    - cursor fade-blink
 *
 * TO FIX:
 * * tmux is somehow changing the cursor to be a block instead of a beam
 * * different font size for non-ascii text (airline)
 * * font colors are too bold (e.g. try `ps ax | grep tmux`)
 * * accent characters coming up when holding `l`
 * * different background color in vim vs. bash (buffer borders)
 *  - I could create my own oceanic colorscheme, and just save it directly in here
 * * different colorscheme once loading Tmux (mainly background color in vim)
 * * beam cursor is too wide
 *
 */
module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    // fontFamily: 'Operator Mono Book, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    fontFamily: '"Operator Mono", "monofur for Powerline", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: 'rgba(248,28,229,0.8)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // color of the text
    // foregroundColor: '#fff',

    // terminal background color
    // backgroundColor: '#000',

    // border color (window, tabs)
    // borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: `
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '0px 6px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // colors: {
    //   black: '#000000',
    //   red: '#ff0000',
    //   green: '#33ff00',
    //   yellow: '#ffff00',
    //   blue: '#0066ff',
    //   magenta: '#cc00ff',
    //   cyan: '#00ffff',
    //   white: '#d0d0d0',
    //   lightBlack: '#808080',
    //   lightRed: '#ff0000',
    //   lightGreen: '#33ff00',
    //   lightYellow: '#ffff00',
    //   lightBlue: '#0066ff',
    //   lightMagenta: '#cc00ff',
    //   lightCyan: '#00ffff',
    //   lightWhite: '#ffffff'
    // },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    // shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'false',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // `hyperclean`
    // 'hyper-sierra-vibrancy',
    'hyperterm-oceanic-next',
    'hyperterm-title',
    // 'hyperterm-base16-ocean-saturated'
  ],
  // hyperclean: {
  //   hideTabs: true, // default: false 
  // },

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
