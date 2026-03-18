return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                opts = {}, -- TODO remove some of the clutter in the debug UI later
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
            dap.adapters.gdb_multi = {
                type = "executable",
                command = "gdb-multiarch",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }

            -- Logan rootfs location
            local fw_root = vim.fn.expand("~") .. "/ws/fw/worktrees/main/port/realtek/stark/logan/dist/rootfs.prod"
            -- Bazel workspace root (where /proc/self/cwd resolves at build time)
            local src_root = vim.fn.expand("~") .. "/ws/roku/fw/worktrees/main/sources/rokuos/os"

            -- C/C++ configurations
            dap.configurations.cpp = {
                {
                    name = "[C++] Launch executable (prompt)",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "[C++] Attach to Logan Application",
                    type = "gdb_multi",
                    request = "attach",
                    program = fw_root .. "/bin/Application",
                    target = (vim.fn.getenv("ROKU_DEV_TARGET") or "") .. ":5555",
                    cwd = "${workspaceFolder}",
                    initCommands = {
                        "set style enabled off",
                        "set pagination off",
                        "set sysroot " .. fw_root,
                        "set solib-absolute-prefix " .. fw_root,
                        "add-auto-load-safe-path " .. fw_root,
                        -- Bazel records comp_dir as /proc/self/cwd. GDB expands that symlink
                        -- against its own /proc/self/cwd (i.e. GDB's working directory).
                        -- By cding to src_root, DWARF paths resolve to src_root/RokuOS/...
                        -- which matches the absolute paths nvim-dap sends for breakpoints.
                        "cd " .. src_root,
                        "handle SIG38 noprint nostop",
                        "handle SIG33 noprint nostop",
                    },
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
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
