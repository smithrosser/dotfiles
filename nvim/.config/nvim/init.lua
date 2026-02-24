if os.getenv("TMUX") then
    vim.opt.allowrevins = true
end

require("configs.lazy")
require("mappings")
require("options")
