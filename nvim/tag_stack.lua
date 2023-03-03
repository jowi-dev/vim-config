--local nvim_command = vim.api.nvim_command
--local nvim_get_current_buf = vim.api.nvim_get_current_buf
--
--local gui_window = nil
--
--function open_gui_window()
--  gui_window = nvim_command("botright new")
--  nvim_command("resize 10")
--  nvim_command("winbufnr " .. gui_window)
--end
--
--function close_gui_window()
--  if gui_window then
--    nvim_command("close " .. gui_window)
--    gui_window = nil
--  end
--end
--
--function toggle_gui_window()
--  if gui_window then
--    close_gui_window()
--  else
--    open_gui_window()
--  end
--end
--
--function display_file_name()
--  local buf = nvim_get_current_buf()
--  local name = buf.name
--  local file_name = string.match(name, "[^/]*$")
--  local extension = string.match(file_name, "%.([^.]*)$")
--  nvim_command("call setline(1, '" .. file_name .. "')")
--  nvim_command("call setline(2, '" .. extension .. "')")
--end
--
--nvim_command("command! ToggleGuiWindow lua toggle_gui_window()")
--nvim_command("autocmd BufEnter * lua display_file_name()")

local nvim_command = vim.api.nvim_command

local gui_window = nvim_command("botright new tag_stack")
print(nvim_command("buffers"))
nvim_command("resize 10")
nvim_command("wincmd p")
--nvim_command("winbufnr " .. gui_window)


--function open_gui_window()
--  --gui_window = nvim_command("botright new")
--  nvim_command("resize 10")
--  nvim_command("winbufnr " .. gui_window)
--end

function close_gui_window()
  if gui_window then
    nvim_command("close " .. gui_window)
    gui_window = nil
  end
end

function toggle_gui_window()
  if gui_window then
    close_gui_window()
  else
    open_gui_window()
  end
end

nvim_command("command! ToggleGuiWindow lua toggle_gui_window()")
