require("hotpot").setup({
	provide_require_fennel = true,
	compiler = {
		macros = {
			env = "_COMPILER",
			allowedGlobals = false,
			compilerEnv = _G, -- If you comment this the error stops
		},
	},
})
require("core")
