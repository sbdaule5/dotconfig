local gen = require("gen")

gen.setup({
    model = "llama3.1:latest",
    host = "localhost",
    port = "11434",
    display_mode = "float", -- The display mode. Can be "float" or "split".
    show_prompt = true, -- Shows the Prompt submitted to Ollama.
    show_model = true,
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
    debug = false, -- Prints errors and the command which is run.
})

-- Custom prompts
gen.prompts["Elaborate_Text"] = {
    prompt = "Elaborate the following text:\n$text",
    replace = true,
}
gen.prompts["Fix_Code"] = {
    prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```",
}
gen.prompts["Write documentation"] = {
    prompt = "Write documentation for the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```. Do not repeat the code only write the documentation.",
    replace = false,
}

vim.keymap.set({ "n", "v" }, "<leader>fa", ":Gen<CR>")
vim.keymap.set({ "n", "v" }, "<leader>aa", ":Gen Ask<CR>")
vim.keymap.set({ "n", "v" }, "<leader>am", "<CMD>lua require('gen').select_model()<CR>")
