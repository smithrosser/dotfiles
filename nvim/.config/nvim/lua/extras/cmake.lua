local M = {}

M.resolve_cmake_executable = function()
    -- Using a coroutine allows the debugger to "wait" for your selection
    return coroutine.create(function(dap_run)
        -- Resolve build path
        local build_path = vim.fn.getcwd() .. "/build"
        if vim.fn.isdirectory(build_path) == 0 then
            vim.notify("Build directory not found", vim.log.levels.ERROR)
            coroutine.resume(dap_run, nil)
            return
        end

        -- Glob files in build path
        local files = vim.fn.globpath(build_path, "**/*", false, true)
        local executables = {}
        for _, file in ipairs(files) do
            if vim.fn.executable(file) == 1 and vim.fn.isdirectory(file) == 0 then
                table.insert(executables, file)
            end
        end

        -- Exit if no executables present
        if #executables == 0 then
            vim.notify("No executables found in 'build' dir", vim.log.levels.ERROR)
            coroutine.resume(dap_run, nil)
            return
        end

        -- Prompt the user for executable
        vim.ui.select(executables, {
            prompt = "Select executable to debug:",
            format_item = function(item)
                return vim.fn.fnamemodify(item, ":.")
            end,
        }, function(choice)
            -- Start debugging
            coroutine.resume(dap_run, choice)
        end)
    end)
end

return M
