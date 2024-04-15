local gen = require("gen")

gen.setup({
    model = "mistral:instruct",
    host = "localhost",
    port = "11434",
    display_mode = "float", -- The display mode. Can be "float" or "split".
    show_prompt = false, -- Shows the Prompt submitted to Ollama.
    show_model = false,
    no_auto_close = false,
    init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- Function to initialize Ollama
    command = function(options)
        return "curl --silent --no-buffer -X POST http://"
            .. options.host
            .. ":"
            .. options.port
            .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    debug = false, -- Prints errors and the command which is run.
})

vim.keymap.set({ 'n', 'v' }, '<leader>fa', ':Gen<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>aa', ':Gen Ask<CR>')
