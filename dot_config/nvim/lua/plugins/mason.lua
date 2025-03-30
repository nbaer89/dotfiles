return {
    {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	opts_extend = {
	    "esnure_installed",
	},
	opts = {
	    ensure_installed = {
		"stylua",
		"shfmt",
	    },
	},
	config = function(_, opts)
	    require("mason").setup(opts)
	end
    },
}
