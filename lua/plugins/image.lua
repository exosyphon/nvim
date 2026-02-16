return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    config = function()
      -- Workaround: luarocks >= 3.13.0 moved vendored modules (dkjson, argparse, etc.)
      -- into luarocks/vendor/ but the loader expects them at top-level package.path.
      -- Add the vendor path before setup so require("dkjson") can resolve.
      local rocks_path = vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks"
      package.path = package.path .. ";" .. rocks_path .. "/share/lua/5.1/luarocks/vendor/?.lua"
      require("luarocks-nvim").setup({ rocks = { "magick" } })
    end,
  },
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    config = function()
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
            resolve_image_path = function(document_path, image_path, fallback)
              return fallback(document_path, image_path)
            end,
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      })
    end,
  },
}
