-- Get an array of all open windows
local allWindows = hs.window.allWindows()

-- Loop through the array of windows and print information about each one
for i, win in ipairs(allWindows) do
	print("Window " .. i .. ":")
	print("  Application: " .. win:application():name())
	print("  Title: " .. win:title())
	print("  ID: " .. win:id())
	print("  Frame: " .. hs.inspect(win:frame()))
	print("  Is visible? " .. tostring(win:isVisible()))
end
