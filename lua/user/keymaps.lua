local opts = {noremap=true, silent=true}

-- set leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Delete to blackhole buffer
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')

-- Nvim-Tree
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Basic
vim.cmd("command! W w")
vim.keymap.set("n", "Ð", ":bd <CR>")
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<CR>", "<Nop>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<space>bh", ":Startify<CR>")

-- Clipboard stuff
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("i", "<C-p>", "<Esc>yiWA<Space><C-r>0<Esc>?<Space><CR>:noh<CR>i", opts)


-- Dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- moving to start and end of linetext
vim.keymap.set({"n", "o", "x"}, "<s-h>", "^", opts)
vim.keymap.set({"n", "o", "x"}, "<s-l>", "g_", opts)

--Moving Text
vim.cmd([[
"Moving text
nnoremap  ̋ :m .+1<CR>==
nnoremap  ̊ :m .-2<CR>==

inoremap  ̋ <Esc>:m .+1<CR>==gi
inoremap  ̊ <Esc>:m .-2<CR>==gi

vnoremap  ̋ :m '>+1<CR>gv=gv
vnoremap  ̊ :m '<-2<CR>gv=gv
]])

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--Switching between split windows
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

--Python
vim.cmd([[ 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
]])
