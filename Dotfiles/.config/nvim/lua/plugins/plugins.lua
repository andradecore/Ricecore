vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'm4xshen/autoclose.nvim'
  use 'frabjous/knap'
end)
