return {
	'mfussenegger/nvim-dap',
	dependencies = {
		-- ui plugins to make debugging simplier
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',
		'leoluz/nvim-dap-go',
	},
	config = function()
		-- gain access to the dap plugin and its functions
		local dap = require 'dap'
		-- gain access to the dap ui plugin and its functions
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup({
			ensure_installed = { 'delve', 'coreclr' },
			automatic_installation = true,
			handlers = {},
		})

		require('dap-go').setup()

		dap.configurations.cs = {
			{
				type = 'coreclr',
				name = 'launch - netcoredbg',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
				end,
			},
		}

		-- Setup the dap ui with default configuration
		dapui.setup()

		-- setup event listeners for the debugger ui
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set('n', '<leader>bt', dap.toggle_breakpoint, { desc = 'Debug toggle Breakpoint' })
		vim.keymap.set('n', '<leader>bs', dap.continue, { desc = 'Debug start' })
		-- set a vim motion to close the debugging ui
		vim.keymap.set('n', '<leader>bc', dapui.close, { desc = 'Debug close' })
		
		vim.keymap.set('n', '<leader>bo', dap.step_over, { desc = 'Debug step over' })
		vim.keymap.set('n', '<leader>bi', dap.step_into, { desc = 'Debug step into' })
		vim.keymap.set('n', '<leader>bx', dap.step_out, { desc = 'Debug step out' })
	end,
}
