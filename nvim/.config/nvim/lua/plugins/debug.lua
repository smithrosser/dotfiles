return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                opts = {
                    layouts = {
                        {
                            -- The Right Panel (Locals)
                            elements = {
                                { id = "scopes", size = 1.0 }, -- "scopes" contains your local variables
                            },
                            position = "right",
                            size = 40,
                        },
                        {
                            -- The Bottom Panel (Console)
                            elements = {
                                { id = "repl", size = 1.0 },
                            },
                            position = "bottom",
                            size = 10,
                        },
                    },
                    controls = {
                        enabled = true,
                        element = "repl", -- This ensures the floating control bar remains active
                    },
                    floating = {
                        max_height = nil,
                        max_width = nil,
                        border = "rounded",
                    },
                },
            },
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },

        config = function()
            local dap, dapui = require("dap"), require("dapui")

            -- GDB adapter
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }

            -- C/C++ configurations
            dap.configurations.cpp = {
                {
                    name = "[C++] Debug executable (CMake)",
                    type = "gdb",
                    request = "launch",
                    program = require("extras.cmake").resolve_cmake_executable,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                    console = "internalConsole",
                },
            }

            -- Keymaps
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dc", function()
                dap.set_breakpoint(vim.ui.input({ prompt = "Breakpoint condition:" }))
            end)
            vim.keymap.set("n", "<leader>dl", dap.continue)
            vim.keymap.set("n", "<leader>dk", dap.step_over)
            vim.keymap.set("n", "<leader>dj", dap.step_into)
            vim.keymap.set("n", "<leader>dh", dap.step_out)

            vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint" })
            vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DapBreakpointCondition" })
            vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DapBreakpointRejected" })
            vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint" })
            vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped" })
            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f7768e" }) -- bright red
            vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e0af68" }) -- yellow
            vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#6b7089" }) -- muted
            vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#7dcfff" }) -- cyan
            vim.api.nvim_set_hl(0, "DapStopped", { fg = "#9ece6a" }) -- green

            -- Auto open/close dapui window on specific events
            dap.listeners.before.attach.dapui_config = dapui.open
            dap.listeners.before.launch.dapui_config = dapui.open
            dap.listeners.before.event_terminated.dapui_config = dapui.close
            dap.listeners.before.event_exited.dapui_config = dapui.close
        end,
    },
}
