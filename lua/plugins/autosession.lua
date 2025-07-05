return {
    'rmagatti/auto-session',
    lazy = false,

    -- enables autocomplete for opts
    -- @module "auto-session"
    -- @type AutoSession.Config
    opts = function(_, opts)
        opts.suppressed_dirs = { '~/', '~/Documents', '~/Downloads', '/', '~/Applications', '~/Desktop' }
    end,
}
