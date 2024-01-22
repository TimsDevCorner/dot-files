return {
	'mfussenegger/nvim-jdtls',
	layz = false,
	config = function()
		local home = os.getenv('HOME')
		local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
		local config = {
			cmd = {
				'/usr/bin/java',

				'-Declipse.application=org.eclipse.jdt.ls.core.id1',
				'-Dosgi.bundles.defaultStartLevel=4',
				'-Declipse.product=org.eclipse.jdt.ls.core.product',
				'-Dlog.protocol=true',
				'-Dlog.level=ALL',
				'-Xmx1g',
				'--add-modules=ALL-SYSTEM',
				'--add-opens', 'java.base/java.util=ALL-UNNAMED',
				'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

				'-javaagent:/usr/share/java/lombok/lombok.jar',

				'-jar', home .. '/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
				'-configuration', home .. '/.local/share/jdtls/config_linux',

				'-data', workspace_folder
			},
			root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', 'mvnw', '.git' }, { upward = true })[1]),
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				require('jdtls').start_or_attach(config)
			end
		})
	end,
}
