{ pkgs, config, ... }:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		plugins = with pkgs.vimPlugins; [
			#treesitter
			nvim-treesitter
			#nvim-treesitter.withAllGrammars
			nvim-treesitter-parsers.c
			nvim-treesitter-parsers.go
			nvim-treesitter-parsers.jq
			nvim-treesitter-parsers.vim
			nvim-treesitter-parsers.tsx
			nvim-treesitter-parsers.nix
			nvim-treesitter-parsers.lua
			nvim-treesitter-parsers.cpp
			nvim-treesitter-parsers.yaml
		  nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.make
      nvim-treesitter-parsers.java
      nvim-treesitter-parsers.http
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.fish
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.gosum
      nvim-treesitter-parsers.gomod
      nvim-treesitter-parsers.cmake
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.comment
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.terraform
      nvim-treesitter-parsers.git_config
      nvim-treesitter-parsers.dockerfile
      nvim-treesitter-parsers.jsonc
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.nix
			nvim-treesitter-textobjects
      nvim-ts-autotag
      nvim-treesitter-endwise 

      #telescope
      telescope-nvim

      #lsp
      lsp-zero-nvim
      nvim-cmp
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-navic
      luasnip
      neodev-nvim
      cmp-buffer
      cmp_luasnip
      cmp-path
      cmp-nvim-lua
      lspkind-nvim
      nvim-autopairs
      indent-blankline-nvim
      go-nvim

      #git
      git-blame-nvim

      #folds
      promise-async
      nvim-ufo
      nvim-colorizer-lua
      vim-tmux-navigator
      #colorschemes
      #tokyonight-nvim
      #catppuccin-nvim
      rose-pine

      auto-session
      nvim-web-devicons
		];
    
		extraConfig = ''
			lua << EOF
			${builtins.readFile neovim/init.lua}
      ${builtins.readFile neovim/setup/telescope.lua}
      ${builtins.readFile neovim/setup/treesitter.lua}
      ${builtins.readFile neovim/setup/ui.lua}
      ${builtins.readFile neovim/setup/lsp.lua}
      ${builtins.readFile neovim/setup/folds.lua}
      ${builtins.readFile neovim/setup/terminal.lua}
      ${builtins.readFile neovim/setup/statusline.lua}
      ${builtins.readFile neovim/setup/go.lua}
      ${builtins.readFile neovim/setup/git.lua}
      ${builtins.readFile neovim/setup/mappings.lua}
      ${builtins.readFile neovim/setup/theme.lua}
		'';
	};
}
