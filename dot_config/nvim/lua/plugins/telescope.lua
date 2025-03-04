return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
	  { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	  { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}
