// requires custom firefox build: https://github.com/glacambre/firefox-patches
let annoying_keys = ['<C-j>', '<C-w>', '<C-l>', '<C-k>', '<C-n>', '<C-i>', '<C-h>', '<C-d>']

let nmaps = Object.keys(tri.config.get('nmaps'));
let exmaps = Object.keys(tri.config.get('exmaps'));
let imaps = Object.keys(tri.config.get('imaps'));

function unbind(mode, key) {
  tri.excmds.bind(`--mode=${mode}`, key, 'echo ""')
}

annoying_keys.forEach(k => {
  if(!nmaps.includes(k)) {
    unbind('normal', k)
  }

  if(!exmaps.includes(k)) {
    unbind('ex', k)
  }

  if(!imaps.includes(k)) {
    unbind('insert', k)
  }
})
