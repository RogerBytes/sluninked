local function slug_leaf(name)
  name = string.lower(name)
  name = name:gsub("%s+", "_")
  name = name:gsub("[^%w%._%-]", "_")
  name = name:gsub("_+", "_"):gsub("^_+", ""):gsub("_+$", "")
  return name
end

function Link(el)
  if el.target:match("%.md$") then
    local tgt = el.target:gsub("%.md$", ".html")
    local dir, leaf = tgt:match("^(.-)([^/]+)$")
    if not dir then dir = "" ; leaf = tgt end
    leaf = slug_leaf(leaf)
    el.target = dir .. leaf
  end
  return el
end