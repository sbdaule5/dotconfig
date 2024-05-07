require("overseer").setup({
    strategy = "terminal",
    templates = { "builtin" },
    auto_detect_success_color = true,
    -- Patch nvim-dap to support preLaunchTask and postDebugTask
    dap = false,
    -- Configure the task list
    task_list = {
        -- Default detail level for tasks. Can be 1-3.
        default_detail = 1,
        max_width = { 100, 0.2 },
        min_width = { 40, 0.1 },
        width = nil,
        max_height = { 20, 0.1 },
        min_height = 8,
        height = nil,
        separator = "────────────────────────────────────────",
        -- Default direction. Can be "left", "right", or "bottom"
        direction = "right",
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
            ["?"] = "ShowHelp",
            ["g?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["<C-q>"] = "OpenQuickFix",
            ["p"] = "TogglePreview",
            ["+"] = "IncreaseDetail",
            ["-"] = "DecreaseDetail",
            ["L"] = "IncreaseAllDetail",
            ["H"] = "DecreaseAllDetail",
            ["R"] = "RunAction restart",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
            ["<C-n>"] = "ScrollOutputUp",
            ["<C-p>"] = "ScrollOutputDown",
            ["q"] = "Close",
        },
    },
    -- See :help overseer-actions
    actions = {
        --[[ ["Restart in floating Terminal"] = {
            desc = "Restart the activity and open it in a floating window",
            run = function(task)
                -- Your custom logic here
            end,
        }, ]]
        -- Complete this function
    },
    -- Configure the floating window used for task templates that require input
    -- and the floating window used for editing tasks
    form = {
        border = "rounded",
        zindex = 40,
        min_width = 80,
        max_width = 0.9,
        width = nil,
        min_height = 10,
        max_height = 0.9,
        height = nil,
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
            winblend = 10,
        },
    },
    task_launcher = {
        bindings = {
            i = {
                ["<C-s>"] = "Submit",
                ["<C-c>"] = "Cancel",
            },
            n = {
                ["<C-c>"] = "Cancel",
                ["<CR>"] = "Submit",
                ["<C-s>"] = "Submit",
                ["q"] = "Cancel",
                ["?"] = "ShowHelp",
            },
        },
    },
    task_editor = {
        bindings = {
            i = {
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
                ["<C-c>"] = "Cancel",
            },
            n = {
                ["<C-c>"] = "Cancel",
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
                ["q"] = "Cancel",
                ["?"] = "ShowHelp",
            },
        },
    },
    -- Configure the floating window used for confirmation prompts
    confirm = {
        border = "rounded",
        zindex = 40,
        min_width = 20,
        max_width = 0.5,
        width = nil,
        min_height = 6,
        max_height = 0.9,
        height = nil,
        win_opts = {
            winblend = 10,
            winhighlight = "NormalNC",
        },
    },
    -- Configuration for task floating windows
    task_win = {
        -- How much space to leave around the floating window
        padding = 2,
        border = "rounded",
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
            winblend = 10,
        },
    },
    -- Configuration for mapping help floating windows
    help_win = {
        border = "rounded",
        win_opts = {},
    },
    -- Aliases for bundles of components. Redefine the builtins, or create your own.
    component_aliases = {
        -- Most tasks are initialized with the default components
        default = {
            { "display_duration", detail_level = 2 },
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            "on_complete_dispose",
        },
        -- Tasks from tasks.json use these components
        default_vscode = {
            "default",
            "on_result_diagnostics",
            "on_result_diagnostics_quickfix",
        },
    },
    bundles = {
        -- When saving a bundle with OverseerSaveBundle or save_task_bundle(), filter the tasks with
        -- these options (passed to list_tasks())
        save_task_opts = {
            bundleable = true,
        },
        -- Autostart tasks when they are loaded from a bundle
        autostart_on_load = true,
    },
    -- A list of components to preload on setup.
    -- Only matters if you want them to show up in the task editor.
    preload_components = {},
    -- Controls when the parameter prompt is shown when running a template
    --   always    Show when template has any params
    --   missing   Show when template has any params not explicitly passed in
    --   allow     Only show when a required param is missing
    --   avoid     Only show when a required param with no default value is missing
    --   never     Never show prompt (error if required param missing)
    default_template_prompt = "allow",
    -- For template providers, how long to wait (in ms) before timing out.
    -- Set to 0 to disable timeouts.
    template_timeout = 3000,
    -- Cache template provider results if the provider takes longer than this to run.
    -- Time is in ms. Set to 0 to disable caching.
    template_cache_threshold = 100,
    -- Configure where the logs go and what level to use
    -- Types are "echo", "notify", and "file"
    log = {
        {
            type = "echo",
            level = vim.log.levels.WARN,
        },
        {
            type = "file",
            filename = "overseer.log",
            level = vim.log.levels.WARN,
        },
    },
})
