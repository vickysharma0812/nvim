local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>ba",
        function()
          local harpoon = require("harpoon")
          harpoon:list():add()
        end,
        mode = { "n" },
        desc = "Mark current buffer",
      },
      {
        "<leader>a",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        mode = { "n" },
        desc = "Toggle quick menu for harpoon",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
      {
        "<leader>bh",
        function()
          local harpoon = require("harpoon")
          toggle_telescope(harpoon:list())
        end,
        mode = { "n" },
        desc = "Telescope harpoon",
      },
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "harpoon add",
        nowait = true,
        remap = false,
      },
      {
        "<leader>hr",
        function()
          require("harpoon"):list():remove()
        end,
        desc = "harpoon remove",
        nowait = true,
        remap = false,
      },
      {
        "<leader>hm",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon menu",
        nowait = true,
        remap = false,
      },
      {
        "<leader>hn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon next file",
        nowait = true,
        remap = false,
      },
      {
        "<leader>hp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon prev file",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon file 1",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon file 2",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon file 3",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon file 4",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon file 5",
        nowait = true,
        remap = false,
      },
      {
        "<leader>h6",
        function()
          require("harpoon"):list():select(6)
        end,
        desc = "harpoon file 6",
        nowait = true,
        remap = false,
      },
    },
  },
}
