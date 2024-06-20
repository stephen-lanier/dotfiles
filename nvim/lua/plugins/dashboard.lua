logo = [[
          _____                    _____          
         /\    \                  /\    \         
        /::\____\                /::\    \        
       /::::|   |               /::::\    \       
      /:::::|   |              /::::::\    \      
     /::::::|   |             /:::/\:::\    \     
    /:::/|::|   |            /:::/__\:::\    \    
   /:::/ |::|   |           /::::\   \:::\    \   
  /:::/  |::|___|______    /::::::\   \:::\    \  
 /:::/   |::::::::\    \  /:::/\:::\   \:::\____\ 
/:::/    |:::::::::\____\/:::/  \:::\   \:::|    |
\::/    / ~~~~~/:::/    /\::/   |::::\  /:::|____|
 \/____/      /:::/    /  \/____|:::::\/:::/    / 
             /:::/    /         |:::::::::/    /  
            /:::/    /          |::|\::::/    /   
           /:::/    /           |::| \::/____/    
          /:::/    /            |::|  ~|          
         /:::/    /             |::|   |          
        /:::/    /              \::|   |          
        \::/    /                \:|   |          
         \/____/                  \|___|          

]]

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = vim.split(logo, '\n'), --your header
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'find file',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = '<leader>ff',
                        key_hl = 'Number',
                        key_format = ' [%s]', -- remove default surrounding `[]`
                        action = ':Telescope find_files'
                    },
                    {
                        icon = ' ',
                        desc = 'grep',
                        key = 'g',
                        keymap = '<leader>fg',
                        key_format = ' [%s]', -- remove default surrounding `[]`
                        action = ':Telescope live_grep'
                    },
                    {
                        icon = ' ',
                        desc = 'file explorer',
                        key = 'n',
                        keymap = '<C-SPACE> n',
                        key_format = ' [%s]', -- remove default surrounding `[]`
                        action = 'lua print(4)'
                    },
                },
                footer = {}  --your footer
            }
        })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
