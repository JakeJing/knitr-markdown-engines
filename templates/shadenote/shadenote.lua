-- shadenote.lua
-- Convert \begin{note}...\end{note} into ::: {.note} ... ::: (HTML only)

local function extract_note_content(raw_latex)
	-- Match the content inside \begin{note}...\end{note}
	return raw_latex:match("\\begin{note}(.-)\\end{note}")
end

function RawBlock(el)
	if FORMAT:match("html") then
		local content = extract_note_content(el.text)
		if content then
			-- Parse the content as Markdown to preserve formatting
			local parsed_blocks = pandoc.read(content, "latex").blocks
			return pandoc.Div(parsed_blocks, { class = "note" })
		end
	end
	return nil
end

-- Convert \begin{example}...\end{example} into ::: {.example} ... ::: (HTML only)
local function extract_example_content(raw_latex)
	-- Match the content inside \begin{example}...\end{example}
	return raw_latex:match("\\begin{example}(.-)\\end{example}")
end

function RawBlock(el)
	if FORMAT:match("html") then
		local content = extract_example_content(el.text)
		if content then
			-- Parse the content as Markdown to preserve formatting
			local parsed_blocks = pandoc.read(content, "latex").blocks
			return pandoc.Div(parsed_blocks, { class = "example" })
		end
	end
	return nil
end
