local icons = {
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "了",
	EnumMember = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "ﰮ",
	Keyword = "",
	Method = "ƒ",
	Module = "",
	Property = "",
	Snippet = "﬌",
	Struct = "",
	Text = "",
	Unit = "",
	Value = "",
	Variable = "",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
end
