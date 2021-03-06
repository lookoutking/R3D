fonts={"Delicious-Roman.otf", "Delicious-Italic.otf", "Delicious-Bold.otf", "Delicious-BoldItalic.otf"}

function LoadFont()
	for k, v in pairs(fonts) do
		rocket:LoadFontFace("assets/"..v);
	end
end

function LoadFile(element)
	local t_x=tonumber(element:GetElementById("t_x").attributes.value)
	local t_y=tonumber(element:GetElementById("t_y").attributes.value)
	local t_z=tonumber(element:GetElementById("t_z").attributes.value)

	local r_x=tonumber(element:GetElementById("r_x").attributes.value)
	local r_y=tonumber(element:GetElementById("r_y").attributes.value)
	local r_z=tonumber(element:GetElementById("r_z").attributes.value)

	local zoom=tonumber(element:GetElementById("zoom").attributes.value)

	LoadObjScene(fn, t_x, t_y, t_z, r_x, r_y, r_z, zoom);
end

function OnFilesDropIn(filenames)
	loadingwindow:Show();
	fn=filenames[1]
end

function OnClick(event)
	if event.current_element:GetElementById("window").style["display"] == "none" then
		event.current_element:GetElementById("window").style["display"]="block";
	else
		event.current_element:GetElementById("window").style["display"]="none";
	end
end

function Startup()
	LoadFont()
	maincontext = rocket.contexts["main"]
	debugwindow = maincontext:LoadDocument("assets/debug.rml")
	debugwindow:GetElementById("title"):AddEventListener("dblclick", OnClick, true)
	debugwindow:GetElementById("title").inner_rml="Debug"
	debugwindow:Show()
	

	loadingwindow=maincontext:LoadDocument("assets/loading.rml")
	loadingwindow:GetElementById("title").inner_rml="Load"
end

Startup()
