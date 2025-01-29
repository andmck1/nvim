return {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    init = function()
        require("nvim-tree").setup {
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            disable_netrw = true,
            git = {
                enable = true,
                ignore = false,
            },
            renderer = {
                highlight_git = true,
                group_empty = true,
                special_files = {},
                add_trailing = true,
            },
            view = {
                width = 60
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            },
            sort_by = function(nodes)
                local paths = {}
                for _, node in ipairs(nodes) do
                    table.insert(paths, node.absolute_path)
                end

                -- Run git check-ignore on all paths at once
                local result = vim.system({ "git", "check-ignore", unpack(paths) }):wait()

                local ignored_files = {}
                if result.code == 0 then
                    for line in result.stdout:gmatch("[^\r\n]+") do
                        ignored_files[line] = true
                    end
                end

                -- Assign git ignore status based on batch check
                for _, node in ipairs(nodes) do
                    node.is_gitignored = ignored_files[node.absolute_path] or false
                end

                -- Sorting logic
                table.sort(nodes, function(a, b)
                    -- Always push ignored files to the bottom
                    if a.is_gitignored and not b.is_gitignored then return false end
                    if b.is_gitignored and not a.is_gitignored then return true end

                    -- Folders at the top, files at the bottom
                    local is_a_directory = (a.type == "directory")
                    local is_b_directory = (b.type == "directory")
                    if is_a_directory and not is_b_directory then return true end
                    if is_b_directory and not is_a_directory then return false end

                    return a.name < b.name
                end)

                return nodes
            end
        }
    end
}
